# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
# Hotfix import defaults to running Supporting Objects install/upgrade scripts.
OBJECTS ?= YES
.PHONY: help setup setup-ci doctor lint test test-fast check-schema preflight check ci prepare-release supporting source sync-dev build validate qa production test-install test-deinstall test-upgrade test-release hotfix-export hotfix-production check-source check-release verify-release release-check

help:
	@printf '%s\n' \
	  'Setup and diagnostics:' \
	  '  make setup                         Install local CI tools and Git hook (RESET=YES reinstalls from scratch)' \
	  '  make doctor                        Read-only checks of local tools and setup' \
	  '' \
	  'Quality checks:' \
	  '  make lint                          Run repository linters (pre-commit)' \
	  '  make test                          Run focused offline release-safety tests' \
	  '  make test-fast                     Run schema, metadata and parity tests' \
	  '  make validate                      Validate APEXLang with SQLcl (no database)' \
	  '  make check                         Lint + schema/source + full tests + APEXLang' \
	  '  make check-source                  Check local APEXLang references and DEV app IDs' \
	  '  make check-schema                  Validate manifests, metadata and deinstall SQL (offline)' \
	  '' \
	  'Development and releases:' \
	  '  make prepare-release               Set DEV versions from VERSION.txt' \
	  '  make supporting                    Assemble schema and metadata from Git (offline)' \
	  '  make source                        Export APEXLang from DEV to applications/' \
	  '  make sync-dev                      Overwrite DEV with local APEXLang' \
	  '  make build                         Prepare DEV, export, check, publish, test TEST (OVERWRITE=YES; PREVIOUS_ZIP=path optional)' \
	  '  make check-release                 Check versions and Supporting Objects sources' \
	  '  make verify-release                Verify manifest and checksums (RELEASE_DIR=path optional)' \
	  '  make release-check                 Verify source and candidate (RELEASE_DIR=path optional)' \
	  '' \
	  'Installation and deployment:' \
	  '  make test-install                  Fresh TEST install (RELEASE_DIR=path optional)' \
	  '  make test-deinstall                Install, deinstall, verify empty TEST (RELEASE_DIR=path optional)' \
	  '  make test-upgrade                  Upgrade TEST from GitHub latest (PREVIOUS_ZIP=path, RELEASE_DIR=path optional)' \
	  '  make test-release                  TEST acceptance from GitHub latest (PREVIOUS_ZIP=path, RELEASE_DIR=path optional)' \
	  '  make qa                            Deploy to QA (RELEASE_DIR=path optional)' \
	  '  make production                    Deploy to PROD (RELEASE_DIR=path optional)' \
	  '' \
	  'Emergency hotfix:' \
	  '  make hotfix-export                 Export BOTH QA/UAT apps as SQL (no build)' \
	  '  make hotfix-production             Import both apps; OBJECTS=NO skips Supporting Objects (default YES)'

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

test-fast:
	python3 -m unittest discover -s automation/tests -p 'test_preserved_parity.py' -v
	python3 -m unittest discover -s automation/tests -p 'test_schema_manifests.py' -v
	python3 -m unittest discover -s automation/tests -p 'test_metadata_source.py' -v

test:
	python3 -m unittest discover -s automation/tests -v

check-schema:
	python3 $(SCRIPTS)/lib/assemble_objects.py $(SCRIPTS)/schema/install.list Database --check-only --check-inventory
	python3 $(SCRIPTS)/lib/assemble_objects.py $(SCRIPTS)/schema/upgrade.list Database --check-only
	python3 $(SCRIPTS)/lib/check_deinstall.py $(SCRIPTS)/schema/install.list Database applications/blog-admin/supporting-objects/deinstall-script.sql
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
build:
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

test-install:
	./$(SCRIPTS)/run_install_test.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Always run a fresh install first. The prerequisite is sequential, even with -j.
# RELEASE_DIR also applies to test-install when supplied on the command line.
test-deinstall: test-install
	./$(SCRIPTS)/run_deinstall_test.sh

test-upgrade:
	./$(SCRIPTS)/run_upgrade_test.sh $(if $(PREVIOUS_ZIP),--previous-zip "$(PREVIOUS_ZIP)",) $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Combined TEST acceptance uses GitHub latest by default, or PREVIOUS_ZIP.
# The upgrade script verifies that it is older than the candidate before TEST reset.
# Database target identity and saved connection separation are checked by the scripts.
test-release:
	@$(MAKE) --no-print-directory verify-release
	@$(MAKE) --no-print-directory test-upgrade
	@$(MAKE) --no-print-directory test-deinstall

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
