# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
.PHONY: help setup setup-ci setup-build-api doctor lint test test-fast preflight check ci prepare-release supporting source sync-dev build validate qa production test-install test-deinstall test-upgrade hotfix-export hotfix-production check-source check-release verify-release release-check

help:
	@printf '%s\n' \
	  'Setup and diagnostics:' \
	  '  make setup CONFIRM=YES             Install local CI tools, then compile BUILD_API in DEV' \
	  '  make setup-ci                      Install local lint tools and Git hook only' \
	  '  make setup-build-api               Compile BUILD_API in DEV only (explicit)' \
	  '  make doctor                        Read-only checks of local tools and setup (no DB)' \
	  '' \
	  'Quality checks:' \
	  '  make lint                          Run repository linters (pre-commit)' \
	  '  make test                          Run all Python regression tests' \
	  '  make test-fast                     Run a small selection of regression tests' \
	  '  make validate                      Validate APEXLang with SQLcl (no database)' \
	  '  make check                         Alias for make preflight (lint + test + validate)' \
	  '  make check-source                  Check local APEXLang references and DEV app IDs' \
	  '' \
	  'Development and releases:' \
	  '  make prepare-release CONFIRM=YES   Set DEV versions from VERSION.txt' \
	  '  make supporting                    Generate Supporting Objects SQL from DEV' \
	  '  make source                        Export APEXLang from DEV to applications/' \
	  '  make sync-dev                      Overwrite DEV with local APEXLang (explicit)' \
	  '  make build                         Build versioned SQL release ZIPs (read-only)' \
	  '  make build OVERWRITE=YES           Replace only a safe local release candidate' \
	  '  make check-release                 Check versions and Supporting Objects sources' \
	  '  make verify-release                Verify candidate checksums and manifest' \
	  '  make release-check                 Check release source plus packaged candidate' \
	  '' \
	  'Installation and deployment:' \
	  '  make test-install                  Reset disposable TEST and test installation' \
	  '  make test-deinstall                Test installation, deinstall, assert TEST is empty' \
	  '  make test-upgrade                  Reset TEST and test upgrading a prior release' \
	  '  make qa                            Deploy built SQL release to QA' \
	  '  make production CONFIRM=YES        Promote the same candidate to production' \
	  '' \
	  'Emergency hotfix:' \
	  '  make hotfix-export                 Export BOTH QA/UAT apps as SQL (no build)' \
	  '  make hotfix-production             Import those SQL files into production'

# The preflight is enforced INSIDE the DEV/QA scripts, so direct invocations
# cannot bypass it. Do not duplicate it as a Makefile prerequisite.
# Setup is a single explicit workstation + DEV action. The standalone targets
# remain available and are executed sequentially even with make -j.
setup:
	@test "$(CONFIRM)" = "YES" || (echo 'Setup compiles BUILD_API in DEV. Run: make setup CONFIRM=YES' >&2; exit 1)
	@printf '[apex-blog] Setting up local CI tools, then DEV BUILD_API.\n'
	@$(MAKE) --no-print-directory setup-ci
	@$(MAKE) --no-print-directory setup-build-api
	@printf '[apex-blog] Setup complete.\n'

setup-ci:
	bash ./automation/ci/bootstrap.sh

doctor:
	bash ./automation/ci/doctor.sh

lint:
	bash ./automation/ci/run_pre_commit.sh run --all-files

test-fast:
	python3 -m unittest discover -s automation/tests -p 'test_preserved_parity.py' -v
	python3 -m unittest discover -s automation/tests -p 'test_build_api_object_list.py' -v
	python3 -m unittest discover -s automation/tests -p 'test_ci_reliability.py' -v

test:
	python3 -m unittest discover -s automation/tests -v

preflight:
	./automation/ci/preflight.sh

check: preflight

ci: preflight

setup-build-api:
	./$(SCRIPTS)/setup_build_api.sh --confirm-dev-ddl

prepare-release:
	@test "$(CONFIRM)" = "YES" || (echo 'Requires: make prepare-release CONFIRM=YES' >&2; exit 1)
	./$(SCRIPTS)/prepare_release.sh --confirm-dev-update

supporting:
	./$(SCRIPTS)/supporting_objects.sh

source:
	./$(SCRIPTS)/export_application.sh --source-only

sync-dev:
	./$(SCRIPTS)/import_apps_to_dev.sh --confirm-dev-import

build:
	@case "$(OVERWRITE)" in 	  ""|NO|YES) ;; 	  *) echo 'OVERWRITE must be YES (or omitted): make build OVERWRITE=YES' >&2; exit 2 ;; 	esac
	./$(SCRIPTS)/export_application.sh --build-only $(if $(filter YES,$(OVERWRITE)),--overwrite,)

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
	./$(SCRIPTS)/run_install_test.sh --confirm-reset-test $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Always run a fresh install first. The prerequisite is sequential, even with -j.
# RELEASE_DIR also applies to test-install when supplied on the command line.
test-deinstall: test-install
	./$(SCRIPTS)/run_deinstall_test.sh --confirm-test-deinstall

test-upgrade:
	./$(SCRIPTS)/run_upgrade_test.sh --confirm-reset-test $(if $(PREVIOUS_ZIP),--previous-zip "$(PREVIOUS_ZIP)",) $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

qa:
	./$(SCRIPTS)/import_apps_to_qa.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

production:
	@test "$(CONFIRM)" = "YES" || (echo 'Production requires: make production CONFIRM=YES' >&2; exit 1)
	./$(SCRIPTS)/import_apps_to_pro.sh --confirm-production $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Emergency application-only QA/UAT -> production path. Does not use DEV/TEST,
# release files, BUILD_API, APEXLang, or Supporting Objects installation.
hotfix-export:
	./$(SCRIPTS)/hotfix.sh export

hotfix-production:
	./$(SCRIPTS)/hotfix.sh production
