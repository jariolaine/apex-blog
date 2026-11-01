#!/usr/bin/env bash
# Shared configuration for APEX Blog automation. Source this file; do not execute it.
# Override connection names using environment variables or variables.local.sh.

_config_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
repoHome="$(cd -- "$_config_dir/.." && pwd -P)"
unset _config_dir

sqlScriptDir="$repoHome/automation/sql"
scriptSourceDir="$repoHome/Database"
apexSourceDir="$repoHome/applications"       # APEXlang, not split SQL
buildDir="$repoHome/build"
stackDir="$repoHome/Stack"
stackSrc="$stackDir/terraform"
tempDir="${TMPDIR:-/tmp}"

# These are saved SQLcl connection names, not passwords or connect strings.
devDbConnName="${APEX_BLOG_DEV_CONNECTION:-blog_dev}"
uatDbConnName="${APEX_BLOG_UAT_CONNECTION:-blog_uat}"
prdDbConnName="${APEX_BLOG_PRD_CONNECTION:-blog_prd}"
tstDbConnName="${APEX_BLOG_TST_CONNECTION:-blog_tst}"

devDbSchema="BLOG_DEV"
devWorkspace="$devDbSchema"
uatDbSchema="BLOG_UAT"
uatWorkspace="$uatDbSchema"
prdDbSchema="BLOG_PRD"
prdWorkspace="$prdDbSchema"
tstDbSchema="BLOG_TST"
tstWorkspace="$tstDbSchema"

# Array indexes always correspond: Admin first, then Public Pages.
appAliases=(blog-admin blog)
devAppIds=(402 401)
uatAppIds=(102 101)
prdAppIds=(102 101)
tstAppIds=(102 101)
releaseSqlNames=(blog-administration-latest.sql blog-public-pages-latest.sql)

# Release and previous-release test inputs.
releaseZipName="apex-blog-latest.zip"
stackZipName="apex-blog-stack-latest.zip"
upgDownloadUrl="https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip"
deinstallSqlScript="$apexSourceDir/blog-admin/supporting-objects/deinstall-script.sql"

# BUILD_API generated Supporting Objects source and destination.
# Generated SQL is edited locally by BUILD_API. APEXlang source exports must NOT overwrite it.
objExportDir="$tempDir/blog_objects"
objLogFile="$objExportDir/blog_supporting_objects.log"
installList="$objExportDir/blog_objects.out"
upgradeList="$objExportDir/blog_objects_upgrade.out"

dbForeignKeysFile=("$objExportDir/foreign_keys.sql" "$scriptSourceDir/Tables/foreign_keys.sql")
dbIndexFile=("$objExportDir/foreign_key_indexes.sql" "$scriptSourceDir/Indexes/foreign_key_indexes.sql")
dbObjectsFile=("$objExportDir/database_objects.sql" "$apexSourceDir/blog-admin/supporting-objects/install-scripts/database-objects.sql")
adminAppMetadataFile=("$objExportDir/admin_app_metadata.sql" "$apexSourceDir/blog-admin/supporting-objects/install-scripts/metadata.sql")
publicAppMetadataFile=("$objExportDir/public_app_metadata.sql" "$apexSourceDir/blog/supporting-objects/install-scripts/metadata.sql")
appPostupgradeFile=("$objExportDir/postupgrade.sql" "$apexSourceDir/blog/supporting-objects/upgrade-scripts/postupgrade.sql")
dbDeinstallFile=("$objExportDir/deinstall.sql" "$apexSourceDir/blog-admin/supporting-objects/deinstall-script.sql")
upgradeFile=("$objExportDir/database_objects_upgrade.sql" "$apexSourceDir/blog/supporting-objects/upgrade-scripts/database-objects-upgrade.sql")
pubVwBlogVersion=("$scriptSourceDir/Views/BLOG_V_VERSION.sql" "$apexSourceDir/blog/supporting-objects/install-scripts/create-view-blog-v-version.sql")

# Optional machine-specific overrides; keep this file out of version control.
if [[ -f "$repoHome/automation/variables.local.sh" ]]; then
  source "$repoHome/automation/variables.local.sh"
fi
