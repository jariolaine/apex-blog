# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
# Hotfix import defaults to running Supporting Objects install/upgrade scripts.
OBJECTS ?= YES
.PHONY: help setup setup-ci doctor lint test test-fast check-schema preflight check ci prepare-release supporting source sync-dev build candidate validate qa production test-install test-deinstall test-upgrade test-release hotfix-export hotfix-production check-source check-release verify-release release-check

help:
	@printf '%s\n' \
	  'Setup and diagnostics:' \
	  '  make setup                         Install local CI tools and Git hook' \
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
	  '  make prepare-release CONFIRM=YES   Set DEV versions from VERSION.txt' \
	  '  make supporting                    Assemble schema and metadata from Git (offline)' \
	  '  make source                        Export APEXLang from DEV to applications/' \
	  '  make sync-dev                      Overwrite DEV with local APEXLang (explicit)' \
	  '  make build                         Build versioned SQL release ZIPs (read-only)' \
	  '  make build OVERWRITE=YES           Replace only a safe local release candidate' \
  '  make candidate                     Run quality gate, build and verify candidate' \
	  '  make check-release                 Check versions and Supporting Objects sources' \
	  '  make verify-release                Verify candidate checksums and manifest' \
	  '  make release-check                 Check release source plus packaged candidate' \
	  '' \
	  'Installation and deployment:' \
	  '  make test-install                  Reset disposable TEST and test installation' \
	  '  make test-deinstall                Test installation, deinstall, assert TEST is empty' \
	  '  make test-upgrade                  Reset TEST and test upgrading a prior release' \
  '  make test-release CONFIRM=YES PREVIOUS_ZIP=...  Upgrade, fresh install, deinstall in TEST' \
	  '  make qa                            Deploy built SQL release to QA' \
	  '  make production CONFIRM=YES        Promote the same candidate to production' \
	  '' \
	  'Emergency hotfix:' \
	  '  make hotfix-export                 Export BOTH QA/UAT apps as SQL (no build)' \
	  '  make hotfix-production CONFIRM=YES Import both apps + Supporting Objects (default)' \
	  '  make hotfix-production OBJECTS=NO  Import both apps and skip automatic Supporting Objects'

# The preflight is enforced INSIDE the DEV/QA scripts, so direct invocations
# cannot bypass it. Do not duplicate it as a Makefile prerequisite.
# One local-only setup command; even `make -j` never contacts DEV.
setup: setup-ci
	@printf '[apex-blog] Local setup complete (no database changes).\n'

setup-ci:
	bash ./automation/ci/bootstrap.sh

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

# One safe, sequential build workflow. `make -j` cannot reorder the stages.
# Does not run source/sync-dev/prepare-release or modify tracked sources.
# Candidate publication itself retains the existing exclusive lock and checks.
candidate:
	@test -z "$(RELEASE_DIR)" || { echo 'candidate builds the current VERSION.txt; omit RELEASE_DIR' >&2; exit 2; }
	@$(MAKE) --no-print-directory check
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory release-check

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

# Explicit, destructive acceptance workflow against disposable TEST only.
# Upgrade uses a fixed, older ZIP. test-deinstall itself runs test-install first,
# and asserts zero user objects and no TEST APEX apps after cleanup.
test-release:
	@test "$(CONFIRM)" = "YES" || { echo 'Requires: make test-release CONFIRM=YES PREVIOUS_ZIP=/path/to/older.zip (resets TEST)' >&2; exit 1; }
	@test -n "$(PREVIOUS_ZIP)" || { echo 'test-release requires PREVIOUS_ZIP=/path/to/older.zip; no implicit GitHub download' >&2; exit 2; }
	@test -f "$(PREVIOUS_ZIP)" && test -s "$(PREVIOUS_ZIP)" || { echo 'PREVIOUS_ZIP must be an existing nonempty file' >&2; exit 2; }
	@$(MAKE) --no-print-directory verify-release
	@$(MAKE) --no-print-directory test-upgrade
	@$(MAKE) --no-print-directory test-deinstall

qa:
	./$(SCRIPTS)/import_apps_to_qa.sh $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

production:
	@test "$(CONFIRM)" = "YES" || (echo 'Production requires: make production CONFIRM=YES' >&2; exit 1)
	./$(SCRIPTS)/import_apps_to_pro.sh --confirm-production $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

# Emergency QA/UAT -> production path. Installs Supporting Objects by default;
# no DEV/TEST, release files, APEXLang, or normal preflight gate.
hotfix-export:
	./$(SCRIPTS)/hotfix.sh export

hotfix-production:
	@test "$(CONFIRM)" = "YES" || { echo 'Production hotfix requires: make hotfix-production CONFIRM=YES [OBJECTS=NO]' >&2; exit 1; }
	@case '$(OBJECTS)' in YES|NO) ;; *) echo 'OBJECTS must be YES or NO' >&2; exit 2 ;; esac
	./$(SCRIPTS)/hotfix.sh production --confirm-production $(if $(filter NO,$(OBJECTS)),--skip-supporting-objects,)
