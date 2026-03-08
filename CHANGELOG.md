# Changelog

All notable changes to **learnship** are documented here.

This project uses [semantic versioning](https://semver.org/): `MAJOR.MINOR.PATCH`
- **MAJOR** — significant new capability layers or breaking changes
- **MINOR** — new workflows, skills, or agent personas
- **PATCH** — bug fixes to existing workflows

---

## [v1.1.0] — Install & Workflow Fixes

**Released:** 2026-03-08

### Added

- **`new-project`** — `.windsurf/` is now automatically added to `.gitignore` on every new and existing project, preventing AI platform files from being tracked in user repos
- **`new-project`** — new `commit_mode` configuration option: `auto` (default, commit after each workflow step) or `manual` (skip all git commits, user commits when ready)
- **`templates/config.json`** — new `commit_mode` field with default `auto`
- **Tests** — 3 test suites (`validate_package.sh`, `validate_workflows.sh`, `validate_skills.sh`) with 50 automated checks covering all required files, all 39 workflows, skills structure, and installer
- **CI** — GitHub Actions: 3 jobs — `test`, `lint-shell` (shellcheck), `validate-json`; `npm test` runs the full suite
- **`LICENSE`** — MIT license file
- **`CODE_OF_CONDUCT.md`** — Contributor Covenant

### Fixed

- **`npx` installer** — project install now correctly targets the user's working directory instead of the npx cache (`INIT_CWD` → `LEARNSHIP_INSTALL_CWD`)
- **`install.sh`** — added `realpath` guard to prevent `cp: same file` errors
- **README** — Mermaid diagram node labels now use `<br/>` instead of `\n` (GitHub requires `<br/>` for line breaks inside nodes)
- **README** — CI badge includes `?branch=main` and links to the workflow run page
- **CI** — `run_all.sh` exit code fixed: `set -e` + `((VAR++))` caused false failure when counter was 0

---

## [v1.0.0] — Initial Public Release

**Released:** 2026-03

### Platform

**40 workflows** across the full development lifecycle:

*Core phase loop:*
- `new-project` — full project initialization: questioning → research → requirements → roadmap
- `discuss-phase` — capture implementation decisions before planning
- `plan-phase` — research + create + verify plans for a phase
- `execute-phase` — wave-based parallel execution of all plans
- `verify-work` — manual UAT with auto-diagnosis and fix planning
- `complete-milestone` — archive milestone, tag release, prepare next version
- `new-milestone` — start next version cycle

*Milestone management:*
- `discuss-milestone` — capture goals and anti-goals before starting a milestone
- `add-phase`, `insert-phase`, `remove-phase` — roadmap surgery
- `audit-milestone` — requirement coverage, integration check, stub detection
- `plan-milestone-gaps` — create fix phases from audit findings
- `milestone-retrospective` — 5-question retrospective + spaced review

*Codebase intelligence:*
- `map-codebase` — parallel brownfield analysis (STACK, ARCHITECTURE, CONVENTIONS, CONCERNS)
- `research-phase` — standalone phase research
- `discovery-phase` — structured codebase discovery before planning
- `list-phase-assumptions` — surface intended approach before planning starts

*Execution:*
- `execute-plan` — run a single PLAN.md in isolation
- `quick` — ad-hoc task with atomic commits and state tracking

*Quality & debugging:*
- `debug` — systematic triage → diagnose → fix with persistent session state
- `validate-phase` — retroactive test coverage audit
- `add-tests` — generate unit and E2E tests post-execution
- `diagnose-issues` — batch-diagnose multiple UAT issues in parallel

*Context & knowledge:*
- `transition` — write full handoff document for collaborator or fresh session
- `knowledge-base` — aggregate decisions and lessons into KNOWLEDGE.md
- `decision-log` — ad-hoc architectural decision capture into DECISIONS.md

*Navigation:*
- `progress` — status overview and smart routing
- `pause-work` — save handoff state mid-phase
- `resume-work` — restore full context and continue

*Task management:*
- `add-todo`, `check-todos` — capture and act on ideas mid-session

*Maintenance & config:*
- `health` — project health check with optional `--repair`
- `cleanup` — archive completed milestone phase directories
- `settings` — interactive config editor
- `update` — self-update the platform
- `set-profile` — quick model profile switch
- `reapply-patches` — merge local edits back after an update

*Meta:*
- `help` — show all workflows with descriptions

### Skills

- `agentic-learning` — 11-action neuroscience-backed learning partner (integrated at every workflow checkpoint)
- `frontend-design` — impeccable UI design system with 7 reference files and 17 steering commands

### AGENTS.md System

- `templates/agents.md` — universal project template: Soul + 10 Principles + Platform Context
- `new-project` generates `AGENTS.md` at project root — Windsurf reads it every conversation
- `plan-phase`, `execute-phase`, `debug`, `complete-milestone`, `new-milestone` auto-update it

### Decision Intelligence Layer

- `.planning/DECISIONS.md` — structured cross-phase decision register with DEC-XXX IDs
- `decision-log` — ad-hoc decision capture from any conversation
- `discuss-phase` and `plan-phase` read DECISIONS.md — planner never contradicts active decisions

### Agent Personas

- `planner`, `researcher`, `executor`, `verifier`, `debugger` — 5 specialized agent roles

### Reference Files & Templates

- 8 reference files covering questioning, verification, git, config, model profiles, UI brand, learning design, design commands
- 7 document templates for `.planning/` artifacts and AGENTS.md
