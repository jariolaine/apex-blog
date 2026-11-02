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
# By default, upgrade tests use the newest published release. PREVIOUS_ZIP
# overrides the download; variables.local.sh may override this URL.
upgDownloadUrl="${APEX_BLOG_UPGRADE_DOWNLOAD_URL:-https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip}"
deinstallSqlScript="$apexSourceDir/blog-admin/supporting-objects/deinstall-script.sql"

# Git-owned Supporting Objects: no database exports or temporary path aliases.
dbObjectsFile="$apexSourceDir/blog-admin/supporting-objects/install-scripts/database-objects.sql"
adminAppMetadataFile="$apexSourceDir/blog-admin/supporting-objects/install-scripts/metadata.sql"
publicAppMetadataFile="$apexSourceDir/blog/supporting-objects/install-scripts/metadata.sql"
appPostupgradeFile="$apexSourceDir/blog/supporting-objects/upgrade-scripts/postupgrade.sql"
upgradeFile="$apexSourceDir/blog/supporting-objects/upgrade-scripts/database-objects-upgrade.sql"
pubVwBlogVersionSource="$scriptSourceDir/Views/BLOG_V_VERSION.sql"
pubVwBlogVersionTarget="$apexSourceDir/blog/supporting-objects/install-scripts/create-view-blog-v-version.sql"

# Optional machine-specific overrides; keep this file out of version control.
if [[ -f "$repoHome/automation/variables.local.sh" ]]; then
  source "$repoHome/automation/variables.local.sh"
fi
