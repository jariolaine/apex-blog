# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
.PHONY: help setup-ci lint test test-fast preflight ci setup-build-api prepare-release supporting source sync-dev build validate qa production test-install test-upgrade hotfix-export hotfix-production check-source check-release verify-release

help:
	@printf '%s\n' \
	  'make setup-build-api     Compile BUILD_API into DEV (explicit)' \
		'make prepare-release     Set DEV versions from VERSION.txt (CONFIRM=YES)' \
	  'make supporting          Generate Supporting Objects SQL using BUILD_API' \
	  'make source              Export APEXlang from DEV to applications/ (no SQL build)' \
	  'make sync-dev            Import local APEXlang into DEV (explicit overwrite)' \
	  'make build               Read-only APEXLang build of versioned SQL release ZIPs' \
	  'make build OVERWRITE=YES  Safely replace the current local release candidate' \
	  'make validate            Validate local APEXlang source with SQLcl' \
	  'make test-install        Reset disposable TEST and test fresh installation' \
	  'make test-upgrade        Reset TEST, download GitHub latest (or PREVIOUS_ZIP), then upgrade' \
	  'make qa                  Deploy built SQL release to QA' \
	  'make production          Promote that same built SQL release to production' \
	  'make setup-ci            Install lint tools and Git hook locally' \
	  'make lint                Run all repository linters (pre-commit)' \
	  'make test                Run all Python regression tests' \
	  'make preflight           Lint + full tests + APEXLang validation' \
	  'make check-source        Check local APEXLang references and DEV app IDs' \
	  'make check-release       Verify versions and Supporting Objects before packaging' \
	  'make verify-release      Verify packaged candidate checksums and manifest' \
	  'make hotfix-export       Export BOTH QA/UAT apps as SQL (no build)' \
	  'make hotfix-production   Import those SQL files into production'

# The preflight is enforced INSIDE the DEV/QA scripts, so direct invocations
# cannot bypass it. Do not duplicate it as a Makefile prerequisite.
setup-ci:
	bash ./automation/ci/bootstrap.sh

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

validate:
	./$(SCRIPTS)/validate_apexlang.sh

test-install:
	./$(SCRIPTS)/run_install_test.sh --confirm-reset-test $(if $(RELEASE_DIR),--release-dir "$(RELEASE_DIR)",)

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
