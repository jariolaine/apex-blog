# Developer-facing entry points; database connections live in variables.sh or
# the ignored automation/variables.local.sh file.
SCRIPTS := automation
.PHONY: help setup-build-api prepare-release supporting source sync-dev build validate qa production test-install test-upgrade

help:
	@printf '%s\n' \
	  'make setup-build-api   Compile BUILD_API into DEV (explicit)' \
		'make prepare-release  	Set DEV versions from VERSION.txt (CONFIRM=YES)' \
	  'make supporting    		Generate Supporting Objects SQL using BUILD_API' \
	  'make source        		Export APEXlang from DEV to applications/ (no SQL build)' \
	  'make sync-dev      		Import local APEXlang into DEV (explicit overwrite)' \
	  'make build         		Export APEXlang + complete installable SQL release ZIPs' \
	  'make validate      		Validate local APEXlang source with SQLcl' \
	  'make test-install  		Reset disposable TEST and test fresh installation' \
	  'make test-upgrade  		Reset TEST, install previous release, then upgrade' \
	  'make qa            		Deploy built SQL release to QA' \
	  'make production    		Promote that same built SQL release to production'

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
	./$(SCRIPTS)/export_application.sh

validate:
	./$(SCRIPTS)/validate_apexlang.sh

test-install:
	./$(SCRIPTS)/run_install_test.sh --confirm-reset-test

test-upgrade:
	./$(SCRIPTS)/run_upgrade_test.sh --confirm-reset-test $(if $(PREVIOUS_ZIP),--previous-zip "$(PREVIOUS_ZIP)",)

qa:
	./$(SCRIPTS)/import_apps_to_qa.sh

production:
	@test "$(CONFIRM)" = "YES" || (echo 'Production requires: make production CONFIRM=YES' >&2; exit 1)
	./$(SCRIPTS)/import_apps_to_pro.sh --confirm-production
