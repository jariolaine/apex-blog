# Developing and releasing packaged APEX applications

Research reviewed on **20 November 2026**. This document records the delivery
goal and design rationale for automation maintainers. It compares documented
capabilities; the alternative products were not installed or tested against
this repository. APEX-specific guidance uses the project's **26.1** target.
Other tool versions are identified where relevant.

The [development flow](DEVELOPMENT_FLOW.md) remains the command-order guide.
[Maintenance responsibilities](MAINTENANCE.md) govern changes to automation
and agent instructions. End-user installation belongs in the
[project README](../../README.md).

## Delivery contract and reason for the automation

The product must be distributable as one or more ordinary APEX application
SQL export files. Together, those files contain the application definitions,
application-owned database creation and upgrade SQL, installation metadata,
required seed data, and packaged application assets. Supporting Objects also
carry the authored database cleanup logic. A recipient must be able to import
these exports and install or upgrade their Supporting Objects entirely through
**APEX App Builder in a web browser**. The recipient needs no direct database
client connection, development checkout, command-line tools, migration runtime,
or separately executed database scripts.

This access requirement is central to the automation's purpose. Oracle Cloud
APEX Service is a concrete example: it has no inbound SQL*Net connectivity and
prohibits direct access to its preconfigured REST-SQL endpoint. These restrictions
are specific to APEX Service; they do not describe every Autonomous Database
deployment that includes APEX. See [APEX Service limitations][apex-service-limits].
The service also provides browser database tools and custom REST APIs, but the
package's installation contract requires only App Builder. See
[included service capabilities][apex-service-tools].

Making installation and upgrade approachable for beginners and citizen
developers is a primary goal. The recipient should follow the application-file
order and Supporting Objects prompts without selecting individual schema
patches, resolving script dependencies, or learning the publisher's toolchain.

APEX Blog implements this contract with two exports sharing a parsing schema.
Admin owns the main database installation and deinstallation scripts; Public
carries the database upgrade assembly and version-dependent SQL. Their
dependency order is Admin, then Public. The exact source/output ownership is
documented in [Architecture](ARCHITECTURE.md#source-and-build-ownership).
That division is a project decision, not a universal APEX convention.

The target still needs a compatible Oracle/APEX installation, a workspace,
an appropriately privileged parsing schema, and any external integration
configuration. Packaging application SQL does not provision that platform.
The project README owns those prerequisites. Oracle also documents that an
application export cannot be imported into an earlier APEX release.
See [APEX import compatibility][apex-import].

**Tools for APEX packaging and deployment do exist.** The gap addressed here
is the complete workflow around this project's deliverable: maintain readable
Git-owned sources, assemble them into Supporting Objects, reconcile APEXLang
and DEV deliberately, generate frontend assets, coordinate both applications,
and validate the release files for App Builder installation and upgrade without
a client connection to the target. The review below did not establish a ready
replacement for that complete workflow. This is a bounded finding from the
reviewed documentation, not a claim that no comparable product exists.

## Producer access and recipient access

The release publisher and the recipient have different access requirements.
Connected development tools can help produce a package whose recipient uses
only a browser. Their connection requirements belong to the producer workflow.

| Activity | Current repository implementation |
| --- | --- |
| Assemble Supporting Objects from tracked SQL | `make supporting` runs locally without a database connection. Its input/output map is in [Architecture](ARCHITECTURE.md#source-and-build-ownership). |
| Synchronize DEV definitions, prepare versions, and export release files | The [development and build workflow](DEVELOPMENT_FLOW.md) uses SQLcl with developer-prepared named connections. |
| Run automated database acceptance | The existing workflows use SQLcl against configured disposable TEST. See the [testing runbook](RUNBOOK.md#testing-and-troubleshooting). |
| Install or upgrade a published release | The recipient imports the application SQL files and runs their Supporting Objects through App Builder, following the [end-user README](../../README.md). |

A producer whose source database is accessible only through App Builder faces
a separate constraint. Native App Builder can manage Supporting Objects and
export the application, but the repository's SQLcl-dependent synchronization,
build, and acceptance commands do not implement a browser-only producer
workflow. Local Supporting Objects assembly alone is not a complete release
build. See [native packaging][apex-package] and [App Builder export][apex-export].

## Native Oracle packaging capabilities

APEX Supporting Objects provides ordered installation scripts, prerequisites,
an existing-installation detection query, conditional upgrade scripts, and
authored deinstallation SQL. The developer supplies the scripts and their
conditions. Exporting Supporting Objects includes those definitions; it does
not infer safe migrations for every object in the parsing schema.
See [APEX 26.1 Supporting Objects][apex-package].

The SQL export can encapsulate database definitions and seed SQL with the
application. Oracle recommends exporting complete applications for deployment.
APEXLang remains a supported editable source format; the choice of a standard
SQL release does not require changing this repository's development format.
See [APEX export formats][apex-export].

| Export or import choice | Role and effect |
| --- | --- |
| App Builder import | Required recipient route: import the application and install or upgrade its Supporting Objects through the APEX interface. |
| SQLcl SQL-format (`APPLICATION_SOURCE`) export without `-split` | Producer option that creates a single SQL application export. |
| `-expSupportingObjects Y` | Producer export option that includes Supporting Objects definitions; inclusion alone does not automatically execute them from the command line. |
| `-expSupportingObjects I` | Producer export option that also enables automatic installation or upgrade on command-line import. |
| `APEX_APPLICATION_INSTALL.SET_AUTO_INSTALL_SUP_OBJ(TRUE)` | Enables installation or upgrade in a connected command-line workflow when the export contains the definitions. |

Sources: [SQLcl export options][sqlcl-export],
[automatic Supporting Objects installation][auto-supporting], and
[Supporting Objects installation][apex-package].

The repository currently exports with `Y` in
[`export_application.sh`](../export_application.sh). Its automated installer
sets the API flag to `TRUE` in
[`install_application.sql`](../sql/install_application.sql). This serves the
connected automation environments. Recipients use App Builder's Supporting
Objects installation or upgrade flow; they do not need to run that SQLcl
installer or set the API flag. Exporting with `Y` already carries the packaged
definitions needed by the browser route.

### Existing conditional upgrades in this repository

The package already carries version-dependent upgrade selection. Both the
[Admin](../../applications/blog-admin/supporting-objects/supporting-objects.apx)
and [Public](../../applications/blog/supporting-objects/supporting-objects.apx)
Supporting Objects definitions enable `includeInAppExport` and use an
`upgradeWhenSqlQuery` that checks `USER_VIEWS` for `BLOG_V_VERSION`. This detects
an existing installation. The separate per-script conditions select applicable
upgrade SQL.

The [Public upgrade definitions](../../applications/blog/supporting-objects/upgrade-scripts.apx)
contain these conditions:

| Upgrade scripts | `rowsReturned` condition on `BLOG_V_VERSION` |
| --- | --- |
| `Patch 24.2.20250701 part 1` and `Patch 24.2.20250701 part 2` | `application_date < 20250701` |
| `Drop text indexes` and `Create text indexes` | `application_date < 20231222` |
| `Database objects upgrade` and `Postupgrade` | No individual server-side condition. |

[`BLOG_V_VERSION`](../../Database/Views/BLOG_V_VERSION.sql) derives
`application_date` by converting the final eight characters of the
`G_APP_VERSION` setting in `BLOG_SETTINGS` to a number. The upgrade metadata also
defines execution order and associates each script with its SQL through
`contentFile`. These are
repository source references; the released SQL export embeds the Supporting
Objects definitions and script contents, so recipients do not need those
source files.

Applicability is therefore part of the native package, with no external
migration runner or manual patch selection required. Preserve these semantics
when evaluating another producer tool. This source inspection establishes the
declared conditions, not successful execution of every historical upgrade path;
the coverage and ordering observations below remain separate questions.

## Related tools and how they fit

The comparison asks whether a tool helps the publisher produce native APEX
exports whose schema installation and upgrade run through App Builder on a
target without a database client connection. Producing executable SQL or an
APEX-aware deployment archive alone does not establish that result. Producer
tools may use their own connections and migration machinery; these must not
become recipient requirements. An unverified assembly step is not a claim that
a product cannot be extended or configured to perform it.

| Tool or approach | Documented capability | Fit and remaining integration |
| --- | --- | --- |
| Native APEX Supporting Objects and App Builder | Standard application exports carry installation, upgrade, and deinstallation definitions that recipients use in App Builder. [Oracle documentation][apex-package] | Provides the required browser installation mechanism. The project still owns source assembly, migration semantics, and release acceptance. |
| SQLcl Projects | APEX-aware source capture, staging, release artifacts, and deployment. Oracle documents retaining Supporting Objects. Both SQL and Liquibase artifact formats are described. [Projects][projects], [lifecycle paper][lifecycle-paper] | Candidate for internal producer orchestration while retaining native APEX exports. Its project installer archive is not the required App Builder recipient artifact; see below. |
| SQLcl Liquibase integration | `lb generate-apex-object` supports APEX exports and Supporting Objects options `Y`, `N`, and `I`. [SQLcl 26.1 reference][sqlcl-liquibase] | An APEX-aware internal tool, not only a generic schema migrator. Preserving existing definitions does not establish Git-to-Supporting-Objects assembly. |
| Standalone Liquibase | `update-sql` generates SQL; the documented offline workflow supports targets where Liquibase cannot run. [SQL generation][liquibase-sql], [offline deployment][liquibase-offline] | Can produce SQL without a customer-side Liquibase runtime. The publisher still needs to integrate the scripts, applicability, and history semantics into Supporting Objects for App Builder execution. |
| Flyway | Enterprise `prepare` can generate deployment SQL for equivalent targets without Flyway. Migration-based preparation excludes non-SQL migrations and callbacks. [Prepare reference][flyway-prepare] | Can contribute producer migration tooling. The reviewed feature does not demonstrate assembly of the Supporting Objects metadata and scripts required for the App Builder recipient workflow. |
| dbFlow and dbFlux | dbFlow creates full or delta releases from Git as tarballs applied by its framework. dbFlux supplies VS Code compilation, APEX operations, and static-file minification/upload. [dbFlow deployment][dbflow], [dbFlux][dbflux] | Substantial overlap with development ergonomics and ordered deployment. Their documented workflow differs from distributing only the native application exports. |
| ADT, APEX Deployment Tool | Builds ordered per-schema and per-application patches from Git, with templates and source snapshots. [ADT patch workflow][adt] | Useful precedent for source-based release assembly. The reviewed documentation does not demonstrate embedding its database patches into Supporting Objects. |
| PLEX | Exports existing Supporting Objects and optionally a single-file application SQL export; separate schema DDL/data exports are also available. [PLEX API][plex] | Relevant exporter component. A separate schema export does not by itself put that SQL into the application's installation and upgrade definitions. |
| FlexDeploy | Builds APEX artifacts from App Builder or SCM and supports inclusion of existing Supporting Objects. Its documented `buildAPEX` artifact is a ZIP of split SQL files. [Export operation][flex-export], [build operation][flex-build] | A commercial orchestration option. The reviewed operations do not demonstrate this repository's manifest-to-Supporting-Objects assembly; the final distribution format would need evaluation. |

### SQLcl Projects deserves a specific qualification

Oracle's lifecycle paper explicitly describes using Projects when Supporting
Objects own database installation and upgrades: select the APEX applications
for export and enable `apex.expSupportingObjects = "Y"`. It therefore supports
this packaging approach; it should not be dismissed as incompatible with
Supporting Objects. The paper's examples were validated with APEX 24.2 and
SQLcl 25.1.1. Its `project.filters` filename is historical: the 26.3 guide uses
`ddl.filters` and `dml.filters`. See the [paper, page 19][lifecycle-paper] and
[current Projects structure][projects].

Projects can be used internally while the publisher continues to deliver
native APEX SQL exports. Its connected producer role does not require a
recipient to run Projects or make a client connection to the target. The
documented standard release artifact is an
archive containing an installer and its files, and does not require the source
repository at deployment. The 26.3 guide also describes SQL artifacts, so
Projects must not be characterized as always requiring a Liquibase executor.
See [Projects artifact and format documentation][projects].

SQLcl 26.1 also documents a Projects layout containing an application SQL
export alongside its APEXLang files. Using editable `.apx` source and SQL
release files therefore does not itself rule out Projects. See
[the documented APEXLang layout][projects-apexlang].

For this repository, the decision is whether adopting Projects removes enough
custom work while preserving source ownership, the two-application lifecycle,
and the recipient's App Builder import and Supporting Objects installation or
upgrade. Support for exporting existing Supporting Objects alone does not
answer who assembles or reviews the underlying installation, upgrade, and
deinstallation scripts. A Projects SQL artifact still needs to be assessed
against that native package contract; SQL output by itself does not establish
App Builder compatibility.

### Generated migration SQL is useful, but its baseline matters

Liquibase's documented SQL generation can select changes using migration
history, and its offline guidance requires a representative target state.
Offline mode cannot evaluate database preconditions. Flyway's corresponding
`prepare` workflow likewise describes equivalent targets.
See [Liquibase offline deployment][liquibase-offline] and
[Flyway preparation][flyway-prepare].

The engineering implication is that a script generated for one known database
state is not automatically a reusable installer for every supported product
version. It also still needs an execution route on the target. This project's
route is Supporting Objects in App Builder, with the existing installation
detection and per-script conditions described above. A replacement producer
must preserve that applicability, ordering, version state, and data-preservation
behavior when incorporating generated SQL. An internal migration tool and a
native APEX customer package can coexist when that integration is explicit.

## Release practices for this delivery model

The following are design recommendations for maintainers, derived from the
delivery contract and the cited Oracle capabilities. They do not replace the
implemented command sequence in [Development flow](DEVELOPMENT_FLOW.md).

### Keep source ownership and package contents explicit

Maintain database SQL/PLSQL, APEX definitions, and frontend source in reviewable
files. Generate installation bundles from known inputs with an explicit
execution order. Keep authored migration decisions, metadata, and deinstallation
SQL distinguishable from generated output. Validate the assembled contents
before release; an export option cannot establish that all required scripts
were authored and included. This repository's ownership map is in
[Architecture](ARCHITECTURE.md#source-and-build-ownership).

For multiple applications sharing a schema, give each database operation one
defined place in the installation or upgrade sequence. Document cross-application
dependencies and version compatibility. An application's ordered Supporting
Objects scripts do not establish order between separate application exports.
The Admin/Public sequence above is the project's implementation of that rule.

### Design fresh installation and upgrades separately

A fresh installer creates the current application state. An upgrade must
preserve existing data and apply the changes needed from each supported
starting version. APEX provides installation detection and conditions on
upgrade scripts to support this distinction. See
[conditional upgrades][apex-package].

Retain released migration history and add the new transition instead of
rewriting old version boundaries. Separate structural/data migrations from
replaceable views and PL/SQL. Preserve user-configured values when updating
seed or metadata records. Advance the installed product version only after
the intended migration steps succeed. These are application-specific design
decisions; an exporter or schema comparison cannot infer their business meaning.

### Build a portable application artifact

Keep target workspace, parsing schema, and application-ID choices compatible
with App Builder import. Connected automation sets the workspace, schema, and
application ID and generates a component-ID offset through Oracle's documented
installation APIs. Avoid editing generated APEX export internals to change
destinations.
See [App Builder import][apex-import] and
[command-line installation-context examples][apex-install]. For this project,
developers prepare the named environments; application agents use those
settings under the [established policy](MAINTENANCE.md#configured-connections-and-authorization).

Choose export contents deliberately, including application assets and required
seed data. A complete SQL application export is not the same as selecting the
APEX 26.1 **Full Export** UI preset, which also includes runtime activity and
saved-report data. See [export choices][apex-export]. Record the supported
APEX version independently of the product release version; older APEX targets
cannot be assumed to import a newer export. See [import rules][apex-import].

### Validate the files that recipients will install

Exercise fresh installation, upgrade with representative existing data, and
deinstallation using the release's application files. Successful APEXLang
validation or a schema-source check is useful evidence but does not establish
that packaged SQL installs or preserves customer data. Oracle's Projects
release guidance similarly calls for compilation checks and testing with data
before freezing a release. See [release verification guidance][project-command].

Include the recipient's App Builder installation and upgrade path when
designing release acceptance. Exercise the published files without a database
client or separately executed schema scripts, and check the two-application
order, Supporting Objects choices, and understandable success or failure
messages. The intended recipient should not need knowledge of the automation
to complete those steps. This is a maintainer validation requirement, not a
claim that current automated SQLcl acceptance exercises the browser interface.

Choose upgrade baselines from the product's published support policy. Include
the oldest supported direct-upgrade path and materially different intervening
migration paths when designing coverage. Exercise configured alternative
application IDs and schema names when portability is promised. Deinstallation
should be checked against the package's owned objects, without treating an
application-definition removal as proof of database cleanup.

Development and maintenance of that coverage are automation-maintenance work.
Application agents run the existing checks relevant to their assigned changes,
as defined in [Maintenance](MAINTENANCE.md#roles-and-task-boundaries).

### Freeze the candidate and plan for partial failure

Tie release files to reviewed source and a product version. Record checksums,
relevant tool/runtime versions, and acceptance evidence; promote and publish
the same tested files. A rebuild is a new candidate requiring its own evidence.
The current integrity and overwrite behavior is described in the
[runbook](RUNBOOK.md#candidate-integrity-and-overwrite).

Oracle DDL has implicit commit behavior, so a single SQL file or a two-app
installer is not an atomic rollback boundary. Plan backup, recovery, and
safe retry behavior for partially completed migrations; importing an older
application definition does not reverse arbitrary schema or data changes.
See [Oracle transaction semantics][oracle-commit]. Record the completed steps
and retain useful installation diagnostics when a release fails.

## Current coverage and possible follow-up work

This research does not claim the repository implements every recommendation.
The following distinctions matter when evaluating future automation changes:

| Current evidence | Limit or separately scoped maintenance opportunity |
| --- | --- |
| `make build` includes candidate verification and full TEST acceptance; `make test-release` repeats acceptance. See [Development flow](DEVELOPMENT_FLOW.md#formal-candidate-build-and-release-acceptance). | These are checks of the current workflows, not proof of every supported customer starting state or recovery scenario. |
| Automated database acceptance uses the [SQLcl installer](../sql/install_application.sql) with automatic Supporting Objects execution enabled. | Passing this route does not establish that the App Builder import, Supporting Objects prompts, or beginner installation experience have been exercised. Browser-path coverage is a separately scoped maintenance concern. |
| Formal upgrade acceptance uses the latest stable published GitHub release, while the [end-user README](../../README.md#upgrade) promises direct upgrades from 24.1.0.20240714 or later. | Broader historical/data-migration coverage would require a separately designed acceptance matrix. This observation does not change the public pretest selector or previous-release source policy. |
| TEST reset/deinstallation uses the current checkout's Admin deinstall SQL. See the [testing runbook](RUNBOOK.md#testing-and-troubleshooting). | That does not independently prove deinstallation through the selected artifact's own stored Supporting Objects, particularly for an older candidate. |

Keep App Builder installation and upgrade from native APEX SQL exports as the
delivery contract while assessing standard tools for internal work they can
replace. A useful evaluation should prove source ownership, embedded script
completeness, conditional upgrades, multi-application ordering, and installation
without a target database client or separate migration execution on a small
representative package before proposing a repository migration. Include the
beginner installation experience in that evaluation. The existence of this
custom automation is not a reason to retain implementation that a supported
tool can replace more simply.

## Evidence scope

Oracle sources below cover APEX 26.1, SQLcl 26.1/26.3, and the lifecycle paper
Version 3.2. The paper is architectural evidence, not a current configuration
recipe. Liquibase references are Community 5.0.4; Flyway `prepare` is identified
as Enterprise in the reviewed documentation. FlexDeploy sources are its 11.1
documentation. Compatibility of every third-party tool with this repository's
APEXLang sources was not established. APEX Service documentation establishes
the access restriction motivating the delivery contract; it does not certify
this application on that service. This review inspected documentation and
repository source. It did not run a comparative migration test, an App Builder
installation, or a browser-only producer workflow.

[apex-service-limits]: https://docs.oracle.com/en/cloud/paas/apex/gsadd/restrictions-and-limitations.html
[apex-service-tools]: https://docs.oracle.com/en/cloud/paas/apex/gsadd/welcome-to-oracle-apex-in-oracle-cloud.html
[apex-package]: https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/how-to-create-a-custom-packaged-application.html
[apex-export]: https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/exporting-an-application.html
[apex-import]: https://docs.oracle.com/en/database/oracle/apex/26.1/htmdb/importing-export-files.html
[sqlcl-export]: https://docs.oracle.com/en/database/oracle/apex/26.1/aeadm/exporting-one-or-more-applications.html
[auto-supporting]: https://docs.oracle.com/en/database/oracle/apex/26.1/aeapi/SET_AUTO_INSTALL_SUP_OBJ-Procedure.html
[apex-install]: https://docs.oracle.com/en/database/oracle/apex/26.1/aeadm/installing-an-application.html
[projects]: https://docs.oracle.com/en/database/oracle/sql-developer-command-line/26.3/sqcug/introduction.html
[projects-apexlang]: https://docs.oracle.com/en/database/oracle/sql-developer-command-line/26.1/sqcug/apexlang-project-structure-apexlang.html
[project-command]: https://docs.oracle.com/en/database/oracle/sql-developer-command-line/26.3/sqcug/project-command.html
[lifecycle-paper]: https://www.oracle.com/a/tech/docs/apex-lifecycle-management-v3.pdf
[sqlcl-liquibase]: https://docs.oracle.com/en/database/oracle/sql-developer-command-line/26.1/sqcug/liquibase.html
[liquibase-sql]: https://docs.liquibase.com/community/reference-guide-5-0-4/init-update-and-rollback-commands/update-sql
[liquibase-offline]: https://docs.liquibase.com/community/user-guide-5-0-4/how-do-i-manage-an-offline-database
[flyway-prepare]: https://documentation.red-gate.com/flyway/reference/commands/prepare
[dbflow]: https://maikmichel.github.io/dbFlow/deployment/
[dbflux]: https://github.com/MaikMichel/dbFlux
[adt]: https://github.com/jkvetina/ADT/blob/main/doc/patch.md
[plex]: https://github.com/ogobrecht/plex
[flex-export]: https://flexagon.atlassian.net/wiki/spaces/FD111/pages/12590939046/exportAPEXApplications
[flex-build]: https://flexagon.atlassian.net/wiki/spaces/FD111/pages/12590938998/buildAPEX
[oracle-commit]: https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/COMMIT.html
