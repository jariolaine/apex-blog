# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
# Hotfix import defaults to running Supporting Objects install/upgrade scripts.
OBJECTS ?= YES
.PHONY: help setup setup-ci doctor lint test assets check-assets check-schema preflight check ci prepare-release supporting source sync-dev build validate qa production test-release pretest hotfix-export hotfix-production check-source check-release verify-release release-check reject-previous-zip

help:
	@printf '%s\n' \
	  'Development:' \
	  '  make assets                        Generate application CSS/JS from frontend/' \
	  '  make supporting                    Generate Supporting Objects from Git' \
	  '  make source                        Export APEXLang from DEV to applications/' \
	  '  make sync-dev                      Import local APEXLang into DEV (authorization required)' \
	  '' \
	  'Quality checks:' \
	  '  make lint                          Run repository linters (pre-commit)' \
	  '  make check-assets                  Verify generated CSS/JS (read-only)' \
	  '  make test                          Run application tests (not automation regression tests)' \
	  '  make check-schema                  Check manifests, metadata and deinstall SQL' \
	  '  make check-source                  Validate local APEXLang source references' \
	  '  make validate                      Validate APEXLang locally using SQLcl' \
	  '  make check                         Run the full offline quality gate' \
	  '' \
	  'Disposable TEST:' \
	  '  make pretest                       Test live DEV SQL on TEST (TEST=install|upgrade|deinstall; default all; GitHub baseline)' \
	  '  make test-release                  Test verified candidate: all three stages (RELEASE_DIR=path optional; GitHub baseline)' \
	  '' \
	  'Release and deployment:' \
	  '  make build                         Build and test candidate (OVERWRITE=YES optional; GitHub baseline)' \
	  '  make release-check                 Check release source and candidate (RELEASE_DIR=path optional)' \
	  '  make qa                            Deploy candidate to QA (RELEASE_DIR=path optional)' \
	  '  make production                    Deploy approved candidate to PROD (RELEASE_DIR=path optional)' \
	  '' \
	  'Emergency hotfix:' \
	  '  make hotfix-export                 Export both QA/UAT apps as SQL' \
	  '  make hotfix-production             Import hotfix into PROD (OBJECTS=YES|NO; default YES)'

# The preflight is enforced INSIDE the DEV/QA scripts, so direct invocations
# cannot bypass it. Do not duplicate it as a Makefile prerequisite.
# One local-only setup command; even `make -j` never contacts DEV.
setup: setup-ci
	@printf '[apex-blog] Local setup complete (no database changes).\n'

setup-ci:
	@case "$(RESET)" in ""|NO|YES) ;; *) echo 'RESET must be YES (or omitted): make setup RESET=YES' >&2; exit 2 ;; esac
	bash ./automation/ci/bootstrap.sh $(if $(filter YES,$(RESET)),--reset,)

doctor:
	bash ./automation/ci/doctor.sh

lint:
	bash ./automation/ci/run_pre_commit.sh run --all-files

# Application tests only. Infrastructure regressions are maintainer-only and
# never run through Make or MCP.
test:
	node --test tests/frontend/*.test.cjs

assets:
	node automation/ci/build_assets.mjs

check-assets:
	node automation/ci/build_assets.mjs --check

check-schema:
	python3 $(SCRIPTS)/lib/assemble_objects.py Database/install.list Database --check-only --check-inventory
	python3 $(SCRIPTS)/lib/assemble_objects.py Database/upgrade.list Database --check-only
	python3 $(SCRIPTS)/lib/check_deinstall.py Database/install.list Database applications/blog-admin/supporting-objects/deinstall-script.sql
	python3 $(SCRIPTS)/lib/metadata_source.py check --repo .

preflight:
	./automation/ci/preflight.sh

check: preflight

ci: preflight

prepare-release:
	./$(SCRIPTS)/prepare_release.sh

supporting:
	./$(SCRIPTS)/supporting_objects.sh

source:
	./$(SCRIPTS)/export_application.sh --source-only

sync-dev:
	./$(SCRIPTS)/import_apps_to_dev.sh

# One release command. Supporting Objects generation may update tracked SQL;
# version preparation changes DEV; TEST acceptance resets disposable TEST.
# Never run source and sync-dev automatically: they replace source in opposite
# directions. The exporter refuses DEV/Git drift instead of choosing a winner.
# Its full quality gate runs AFTER temporary DEV exports but BEFORE publication.
# Recursive Make stages stay sequential, including when the caller uses -j.
build: reject-previous-zip
	@$(MAKE) --no-print-directory check-assets
	@case "$(OVERWRITE)" in ""|NO|YES) ;; *) echo 'OVERWRITE must be YES (or omitted): make build OVERWRITE=YES' >&2; exit 2 ;; esac
	@test -z "$(RELEASE_DIR)" || { echo 'build uses current VERSION.txt; omit RELEASE_DIR' >&2; exit 2; }
	@$(MAKE) --no-print-directory supporting OVERWRITE=NO
	@$(MAKE) --no-print-directory prepare-release OVERWRITE=NO
	./$(SCRIPTS)/export_application.sh --build-only $(if $(filter YES,$(OVERWRITE)),--overwrite,)
	@$(MAKE) --no-print-directory release-check
	@$(MAKE) --no-print-directory test-release
	@printf '[apex-blog] Build complete: verified candidate passed TEST upgrade, install and deinstall.\n'

check-source:
	./$(SCRIPTS)/check_source.sh source

check-release:
	./$(SCRIPTS)/check_source.sh release

verify-release:
	./$(SCRIPTS)/verify_release.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Read-only source/version checks followed by checksum and manifest validation.
# The candidate must already exist; this target never builds or overwrites it.
release-check:
	@$(MAKE) --no-print-directory check-release
	@$(MAKE) --no-print-directory verify-release

validate:
	./$(SCRIPTS)/validate_apexlang.sh

# Only official GitHub published releases can be upgrade baselines.
# Reject the retired local ZIP override rather than silently ignoring it.
reject-previous-zip:
	@test -z "$(PREVIOUS_ZIP)" || { echo "PREVIOUS_ZIP is obsolete; GitHub is the sole source of previous releases" >&2; exit 2; }

# Optional disposable TEST verification of live DEV packaged SQL; no candidate.
# Only one optional selector is accepted. Omitting TEST runs every stage.
pretest: reject-previous-zip
	@case "$(TEST)" in ""|install|upgrade|deinstall) ;; *) echo 'TEST must be install, upgrade, deinstall (or omitted for all)' >&2; exit 2 ;; esac
	./$(SCRIPTS)/pretest.sh $(if $(TEST),--test "$(TEST)",)

# Formal release acceptance is never selective. Keep the low-level scripts
# as internal implementation details rather than individual Make targets.
test-release: reject-previous-zip
	@$(MAKE) --no-print-directory verify-release
	./$(SCRIPTS)/run_upgrade_test.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)
	./$(SCRIPTS)/run_install_test.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)
	./$(SCRIPTS)/run_deinstall_test.sh

qa:
	./$(SCRIPTS)/import_apps_to_qa.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

production:
	./$(SCRIPTS)/import_apps_to_pro.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Emergency QA/UAT -> production path. Installs Supporting Objects by default;
# no DEV/TEST, release files, APEXLang, or normal preflight gate.
hotfix-export:
	./$(SCRIPTS)/hotfix.sh export

hotfix-production:
	@case '$(OBJECTS)' in YES|NO) ;; *) echo 'OBJECTS must be YES or NO' >&2; exit 2 ;; esac
	./$(SCRIPTS)/hotfix.sh production $(if $(filter NO,$(OBJECTS)),--skip-supporting-objects,)
