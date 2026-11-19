# Maintaining automation and agent guidance

This guide records the design constraints for maintaining project automation,
MCP interfaces, command help, and application-agent instructions. It applies
when that maintenance work is assigned. Ordinary application work uses
[`AGENTS.md`](../../AGENTS.md) and the prepared tools.

Automation should make APEX, database-object, and frontend development easier
to carry out correctly. A coding agent needs understandable operations and
results without learning the implementation of the automation that provides
them. Preserve that separation when adding features or changing guidance.

## Roles and task boundaries

| Work | Responsible role |
| --- | --- |
| APEX application changes, tracked database-object SQL/PLSQL, frontend source, affected generated outputs, existing application checks, and current application memory | Human developer or coding agent assigned the application task |
| Initial tool/environment preparation, named connections, automation parameters, connectivity configuration, and later environment changes or repair | Human developer |
| Automation implementation, containers, MCP service, command interfaces, automated test-suite development and maintenance, and the design of coding-agent instructions and memory structure | Developer or agent explicitly assigned that maintenance work |

These are task roles; the same developer or agent can perform different roles
when assigned different work. An application task does not implicitly assign
automation repair or test-suite development. Running the existing checks is
part of validating application changes; maintaining their implementation is
separate work.

The developer prepares a usable environment before application work starts.
Application agents report missing tools or failed connections instead of
reconfiguring the environment. Initial setup and subsequent configuration
changes are not a recurring prerequisite for every application task.

## Packaged application delivery

Preserve the [App Builder delivery contract](PACKAGED_APPLICATIONS.md#delivery-contract-and-reason-for-the-automation).
Recipients must be able to install or upgrade the application and its owned
schema by importing the published application SQL exports and using native
Supporting Objects through a browser. Changes must not introduce a direct
database connection, command-line tools, a migration runtime, or separately
executed database scripts as recipient prerequisites.

Beginner and citizen-developer usability is a release requirement. Keep the
application-file order, Supporting Objects choices, and completion or failure
messages understandable in the end-user documentation and APEX interface.
Producer tools may use the developer-prepared connections; evaluate changes
against the recipient workflow as well as the internal build workflow.

## Application data and environment policy

### Source ownership

Tracked `Database/` files are authoritative for database objects. Changes start
in those files, followed by applying the SQL and compiling PL/SQL in DEV under
the task's authorization. Ad hoc SQL queries are performed only when requested
by the developer. This restriction does not remove SQL executed internally by
an authorized workflow or the application of the changed source itself.

Keep three operations distinct:

- `make supporting` generates local Supporting Objects SQL from tracked inputs.
- `make sync-dev` imports APEX and Supporting Objects definitions with automatic
  Supporting Objects installation disabled.
- Applying or compiling changed database-object source to DEV is a separate
  step; neither of those commands performs it.

APEXLang export and import reconcile application definitions in opposite
directions. Preserve the caller's choice of direction and authorization before
overwriting uncommitted work. Do not silently resolve Git/DEV differences or
add an export/import step to the build workflow.

Describe source inputs and generated destinations precisely. Keep generated
Supporting Objects and frontend output distinct from authored installation
metadata, Admin deinstall SQL, plugin source, and static-file declarations.
The detailed ownership and output map is in
[Architecture](ARCHITECTURE.md#source-and-build-ownership).

### Configured connections and authorization

Application agents trust all developer-configured named database connections
and automation parameters. They select the configured environment without
independently verifying endpoints, schema names, workspace mappings, or the
configuration's correctness. A connection failure is reported to the developer;
it does not authorize substituting another connection or repairing the setup.

- **TEST is disposable.** Application installation, upgrade, deinstallation,
  and resets on configured TEST (`blog_tst` by default) are preauthorized through
  SQLcl, SQLcl MCP, and project automation.
- **DEV, UAT, and PROD are persistent.** Database changes require authorization
  for the task. Reuse authorization already granted for the relevant work;
  do not add repeated confirmation steps or confirmation flags.

The existing scripts' automatic environment guards remain safeguards.
Trusting configured mappings means application agents do not repeat those
checks manually; it does not mean removing them. Keep authorization policy,
client approval controls, and automated checks distinct in documentation. State
which conditions are actually enforced and which rely on the operator's
procedure; do not imply that the MCP queue grants approval or that a successful
command proves a release's full approval history.

Connection defaults and configuration precedence belong in
[Environments](ENVIRONMENTS.md). Application-facing authorization rules belong
in `AGENTS.md`; keep them consistent with this maintenance policy.

## Documentation and instruction ownership

| Surface | Content it owns |
| --- | --- |
| Root [`README.md`](../../README.md) | End-user application installation and upgrade |
| [`AGENTS.md`](../../AGENTS.md) | Application responsibilities, source ownership, working procedure, and authorization |
| [Cline rules](../../.clinerules/project-workflow.md) | Routing to application instructions and the Memory Bank read/update procedure |
| [`memory-bank/`](../../memory-bank/) | Retained application knowledge: scope, product behavior, architecture, technology constraints, current decisions, and progress |
| MCP tool and parameter descriptions | The contract callers need to choose, invoke, and follow application-development operations |
| `make help` | Everyday commands, relevant options, destinations, and observable effects |
| [`automation/README.md`](../README.md) and `automation/docs/` | Setup, implementation, technical operation, diagnostics, and maintenance rationale |

This guide owns the maintenance rationale and design constraints. The
application instructions express the corresponding working rules; they do not
need to repeat the maintainer explanation. Link to the document that owns an
operational procedure instead of maintaining copies of it.

Keep automation internals and setup documentation under `automation/`.
Do not insert worker, container, locking, storage, dependency-installation, or
maintenance-test details into agent instructions, Cline rules, application
memory, or public tool descriptions. Public API details needed to make a
correct call remain part of the interface.

Keep instructions concrete and useful. Do not add warnings for operations the
interface already prevents, vague directives such as "match package files",
or repeated environment-verification work. Explain a relevant source/output
relationship or required application action instead.

## Public command and MCP interfaces

Tool descriptions explain an operation's purpose, source or environment
effects, and how callers recognize completion. Parameter descriptions explain
meaning, units, selection rules, and where IDs or filenames come from. Waiting,
result recovery, log paging, and cancellation semantics belong here because
callers need them; worker implementation details belong in the
[MCP maintainer guide](MCP_AUTOMATION.md#published-mcp-tool-contract).

`automation_capabilities` is read-only discovery of currently supported
application operations and their effects. Keep it derived from the implemented
registry. It is not an environment probe or a required first call for every
application task. Do not copy a static capability catalog into application
instructions or the Memory Bank.

Keep `setup` and `doctor` as developer maintenance commands documented under
`automation/`. They are not application MCP tasks or everyday `make help`
entries. Maintain one help entry per user-facing command, with optional
parameters and useful effects in that entry rather than duplicating commands
for every option.

When an operation or API changes, review these surfaces together:

| Source | What must agree with the implemented behavior |
| --- | --- |
| [`automation/mcp/server.py`](../mcp/server.py) | Published tool docstrings, parameter descriptions, defaults, and bounds |
| [`automation/mcp/jobs.py`](../mcp/jobs.py) | Target descriptions, allowed operations, side effects, authorization metadata, and cancellation eligibility |
| [`Makefile`](../../Makefile) | Help text, accepted options, and the actual target recipes |
| [`DEVELOPMENT_FLOW.md`](DEVELOPMENT_FLOW.md) and [`RUNBOOK.md`](RUNBOOK.md) | Operation order, prerequisites, failure handling, and recovery |
| [`MCP_AUTOMATION.md`](MCP_AUTOMATION.md) and [client examples](../mcp/examples/) | Protocol behavior, client configuration, and maintainer procedures |

Inspect the actual MCP tool listing and input schemas when changing its
interface. Schema tests can check description presence, types, defaults,
bounds, and target agreement; they cannot establish that explanatory prose is
correct. Verify client-specific configuration claims against the client's
official documentation, and use the tool names that the client actually
exposes rather than assuming a fixed prefix.

## Maintaining the Memory Bank

The Memory Bank provides application continuity across sessions. Preserve the
six core roles used by the
[Cline Memory Bank method](https://docs.cline.bot/best-practices/memory-bank):

| Core file | Distinct purpose |
| --- | --- |
| `projectbrief.md` | Stable project scope and goals |
| `productContext.md` | User workflows, needs, and product behavior |
| `systemPatterns.md` | Architecture, component relationships, and implementation decisions |
| `techContext.md` | Application technologies, constraints, and runtime dependencies |
| `activeContext.md` | Current focus, recent changes, and pending decisions |
| `progress.md` | Completed milestones and remaining work |

Keep these files substantive and complementary. A concise project foundation
or technology constraint is useful even when a related fact appears in the
end-user README or source. Correct an unsuitable file's contents instead of
deleting its continuity role merely to reduce overlap. References can retain
focused application details behind the core summaries.

Preserve meaningful application history and dated decisions. Distinguish
completed source changes from observed runtime behavior and pending decisions
from assigned work. Do not invent a roadmap, priority, successful deployment,
or missing content to fill a template. Empty boilerplate and duplicated
procedures do not add continuity.

Keep installer steps, automation-maintenance history, setup instructions, test
inventories, and test-development duties out of application memory. A test-suite
description is still irrelevant context for the application agent even when
phrased as a fact. Application behavior, storage limits, integration
dependencies, and decisions affecting future changes are useful context.

Keep Cline's procedure aligned: read the complete bank at task start, core
files first; update affected files after meaningful application changes; review
all core and reference files on an explicit "update memory bank" request while
editing only what needs to change.

## Making and validating changes

Read the implementation before documenting commands, parameters, side effects,
or guarantees. Keep one workflow implementation behind Make and MCP rather
than introducing a second orchestration path. Review related documentation
when behavior changes, including examples and links to renamed files.

Choose validation for the affected behavior. Test-suite implementation belongs
to maintenance work; the distinction between application tests and automation
regressions describes what they exercise, not an extra duty for application
agents. Suite locations and commands are in the
[testing runbook](RUNBOOK.md#testing-and-troubleshooting).

For documentation-only changes, verify the described behavior against source,
relative links and headings, command examples, and patch application. For
execution or interface changes, also run the relevant existing regression or
schema checks. Distinguish offline/mock results from real Oracle compilation
or runtime evidence. Do not claim a check ran when the required tooling or
environment was unavailable.

For patch-based review work, deliver one incremental patch against the latest
supplied and applied repository state. Include new files and renames, check
application to that baseline, and preserve earlier corrections. The requested
deliverable is the patch; do not return full replacement documents unless
explicitly requested.
