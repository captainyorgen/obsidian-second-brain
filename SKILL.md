---
name: obsidian-second-brain
description: >
  Operate any Obsidian vault as a living second brain. Use this skill whenever
  the user asks Claude to read, write, update, search, or manage their Obsidian
  vault — including saving notes from conversation, creating daily entries, updating
  kanban boards, logging dev work, managing people notes, capturing decisions,
  tracking deals, or maintaining any vault structure. Also triggers when the user
  wants to bootstrap a new vault from scratch, run a vault health check, or drop
  a _CLAUDE.md into their vault so all Claude surfaces share the same operating rules.
  Use proactively whenever the conversation produces information worth preserving
  (decisions, people met, projects started, tasks completed, lessons learned).
---

# Obsidian Second Brain

> Claude operates your Obsidian vault as a living OS — not a note-taking app.
> Everything worth remembering gets saved. Every update propagates everywhere it belongs.

---

## Quick Start

### 0. Verify MCP is available

This skill requires the `mcp-obsidian` MCP server to be running with your vault path configured. If vault tools (`get_file_contents`, `search`, etc.) are unavailable, stop immediately and tell the user:

> "The obsidian-vault MCP server isn't connected. Configure it in your Claude settings and restart, then try again."

Do not attempt to improvise vault operations without MCP tools.

### 1. First time in a vault → read `_CLAUDE.md`

Before doing anything in a vault, check if `_CLAUDE.md` exists at the vault root:

```
get_file_contents("_CLAUDE.md")
```

If it exists: follow its rules exactly — they override the defaults in this skill. Where `_CLAUDE.md` is silent, fall back to the defaults below.
If it doesn't exist: use the defaults in this skill, then offer to create one.

### 2. First time with a new user → run discovery

```
list_files_in_vault()
```

Scan the structure to understand: folder names, template locations, naming conventions, frontmatter patterns. Then read 2–3 existing notes with `get_file_contents(path)` to calibrate writing style before creating anything new.

### 3. Bootstrap a new vault

If the user has no vault yet, run:
```bash
python scripts/bootstrap_vault.py --path ~/path/to/vault --name "Your Name"
```

Then configure `mcp-obsidian` to point at the new vault path and restart Claude.

This creates a complete production-ready vault structure with all templates, a Home dashboard, kanban boards, and a pre-filled `_CLAUDE.md`. See `scripts/bootstrap_vault.py`.

---

## Core Operating Principles

### Never create in isolation
Every write operation must ask: *where else does this belong?*

| You create/update... | Also update... |
|---|---|
| A new project note | Kanban board (add to Backlog), today's daily note (link it) |
| A task completed | Kanban board (move to Done), project note (log it), daily note |
| A person note | Daily note (mention interaction), People index if it exists |
| A dev log | Daily note (link it), project note (Recent Activity) |
| A deal update | Side Biz / Deals kanban, Dashboard totals |
| A decision made | Project note (Key Decisions), daily note |
| A mention/shoutout | Mentions Log, person's note, daily note |

Always propagate. Never create a single orphaned note.

### Search before creating
Before creating any new note, search for an existing one:
```
search(query="keyword from title")
```
Duplicate notes are vault rot. Merge or update instead of creating new.

### Match the vault's voice
Read existing notes in the same folder before writing new ones.
Match: frontmatter schema, heading style, list formatting, tone, emoji usage (or lack of it).
Never introduce new conventions — extend what's already there.

### Frontmatter is mandatory
Every note gets frontmatter. At minimum:
```yaml
---
date: 2026-03-24
tags:
  - <note-type>
---
```
See `references/vault-schema.md` for full frontmatter specs by note type.

---

## Write Rules

See `references/write-rules.md` for the complete guide. Summary:

- **Links**: Use `[[Note Name]]` for internal links. Always link to people, projects, and jobs mentioned in a note.
- **Dates**: ISO format (`YYYY-MM-DD`) in frontmatter. Human format (`March 24`) in body text.
- **Naming**: `YYYY-MM-DD — Title.md` for dated notes. `Title.md` for evergreen notes. No special characters except `—` (em dash).
- **Status values**: `active` / `planning` / `completed` / `archived` / `on-hold` for projects. `in-progress` / `done` / `waiting` for tasks.
- **Kanban**: Items follow the format `- [ ] 🔴 **Title** · @{YYYY-MM-DD}\n\tDescription [[Link]]`

---

## The `_CLAUDE.md` File

This is the most important concept in this skill.

`_CLAUDE.md` lives at the vault root and persists Claude's operating rules across every session and every surface (Claude Desktop, Claude Code, VS Code, terminal). Without it, Claude has to re-learn your vault conventions every conversation.

**Precedence rule:** `_CLAUDE.md` wins on all vault-specific rules (folder names, naming conventions, frontmatter fields, auto-save behavior, private folders). The defaults in this skill file apply only where `_CLAUDE.md` is silent. Never let skill defaults override an explicit `_CLAUDE.md` rule.

**What it contains:**
- Your vault's folder map and what each folder is for
- Frontmatter schemas for your specific note types
- Naming conventions you use
- What to auto-save vs. what to ask first
- People and projects that need special handling
- Links to key files (boards, dashboard, templates)

To generate a `_CLAUDE.md` for an existing vault, run vault discovery then use the template in `references/claude-md-template.md`.

To install it: write the file to the vault root. Every Claude session that starts in that vault should read it first.

---

## Common Operations

### Save info from conversation
When a conversation produces something vault-worthy:
1. Identify the note type (decision → project note, person met → People/, task → board + Tasks/, etc.)
2. Check if a relevant note already exists
3. Write or update — always frontmatter-first
4. Propagate to boards, daily note, linked notes

### Create today's daily note
```
date = today in YYYY-MM-DD format
path = Daily/{date}.md
```
Read `Templates/Daily Note.md`, fill in the date fields, create the file.
Then scan recent conversation for anything worth logging in today's sections.

### Log a dev session
Read `Templates/Dev Log.md`. Fill: date, project name, what was worked on, problems solved, decisions made, next steps.
Save to `Dev Logs/YYYY-MM-DD — Project Name.md`.
Link from project note's Recent Activity section and today's daily note.

### Update a kanban board
Boards use the `kanban-plugin: board` frontmatter.
Columns are `## Column Name` headers.
Items are `- [ ] **Title** · @{due-date}\n\tDescription [[Links]]`
Completed items move to the `## ✅ Done` column with a strikethrough: `- [x] ~~**Title**~~ ✅ Date`

### Run vault health check
```bash
python scripts/vault_health.py --path ~/path/to/vault
```
Reports: duplicate notes, orphaned files (no incoming links), stale tasks (overdue), empty folders, broken links, notes missing frontmatter.

Proactively suggest running this when the user says the vault feels messy, notes are hard to find, they mention duplicates, or they haven't mentioned a health check in a long time. Offer: *"Want me to run a vault health check?"*

---

## Commands

These slash commands can be used in any Claude surface. Each one is smart — it reads context, searches before writing, and propagates everywhere changes belong.

**Name matching:** If a name argument has a typo or is approximate, search the vault for the closest match, show what was found, and confirm with the user before proceeding. Never silently create a note with a misspelled name.

---

### `/obsidian-save`

**The master save command.** Reads the entire conversation and extracts everything worth preserving.

Steps:
1. Scan the conversation and identify all vault-worthy items: decisions, tasks, people mentioned, projects started, ideas, learnings, deals, mentions/shoutouts
2. Group items by type: people, projects, tasks, decisions, ideas, deals
3. Spawn parallel subagents — one per group — so all note types are handled simultaneously:
   - **People agent**: search for each person, create or update notes, log interactions
   - **Projects agent**: search for each project, create or update notes
   - **Tasks agent**: parse tasks, add to the right kanban columns
   - **Decisions agent**: find relevant project notes, append to Key Decisions sections
   - **Ideas agent**: search Ideas/ for related notes, create or append
4. After all agents complete: update today's daily note with links to everything saved
5. Report back: a clean list of what was saved and where

Do not ask for guidance on where to save things — infer it. Only ask if something is genuinely ambiguous (e.g. a person mentioned with no context on who they are).

---

### `/obsidian-daily`

**Creates or updates today's daily note.**

Steps:
1. Check if `Daily/YYYY-MM-DD.md` exists for today
2. If not: read `Templates/Daily Note.md`, fill in date fields, create the file
3. Scan the current conversation for anything relevant to today: tasks in progress, people mentioned, decisions made, what's being worked on
4. Pre-fill or update the note's sections with that context
5. If the note already exists, inject new content into the right sections rather than overwriting

Return the path of the daily note when done.

---

### `/obsidian-log`

**Logs a work or dev session to the vault.**

Steps:
1. Infer the project from conversation context — search the vault if needed to find the right project note
2. Read `Templates/Dev Log.md` (or `Templates/Work Log.md` if it exists)
3. Fill in: date, project, what was worked on, problems encountered, decisions made, next steps — all inferred from the conversation
4. Save to `Dev Logs/YYYY-MM-DD — Project Name.md`
5. Inject a link into the project note's Recent Activity section
6. Inject a link into today's daily note Work section

---

### `/obsidian-task [description]`

**Adds a task to the vault and the right kanban board.**

Steps:
1. Parse the task from the argument or from recent conversation context if no argument given
2. Infer: priority (🔴/🟡/🟢), due date, linked project, linked person
3. Search for the right kanban board — use `_CLAUDE.md` board list or search `Boards/`
4. Add the task card to the correct column (`📋 This Week` or `📥 Backlog` depending on due date)
5. Create a task note in `Tasks/` if the task is substantial (more than a one-liner)
6. Link the task from the relevant project note and today's daily note

---

### `/obsidian-person [name]`

**Creates or updates a person note.**

Steps:
1. Search the vault for an existing note matching the name (fuzzy — handle typos and partial names)
2. If found: confirm with user, then update with new info from conversation
3. If not found: create `People/Full Name.md` with full frontmatter schema
4. Fill in everything inferable from the conversation: role, company, context, relationship strength, last interaction date
5. Log the interaction in today's daily note
6. If a People index file exists, add or update the entry there

---

### `/obsidian-decide [optional: topic]`

**Extracts and logs decisions from the conversation.**

Steps:
1. Scan the conversation for decisions made — look for conclusions, choices, commitments, direction changes
2. If a topic argument is given, focus on decisions related to that topic
3. Find the relevant project note(s) — search if needed
4. Append each decision to the project note's `## Key Decisions` section with date
5. Log a summary in today's daily note
6. If a decision affects multiple projects, log it in all of them

---

### `/obsidian-capture [optional: idea text]`

**Quick idea capture with zero friction.**

Steps:
1. Take the argument as the idea, or pull the most recent idea/thought from the conversation
2. Search `Ideas/` for a related existing note — if found, append to it
3. If new: create `Ideas/Title.md` with minimal frontmatter (`date`, `tags: [idea]`)
4. Write the idea with any supporting context from the conversation
5. Add a brief mention in today's daily note under an Ideas or Captures section

---

### `/obsidian-find [query]`

**Smart vault search.**

Steps:
1. Run `search(query="...")` with the provided query
2. Also try variations if results are sparse (synonyms, related terms)
3. Return results with context: note title, folder, a relevant excerpt, and what type of note it is
4. If results are ambiguous, group them by type (people, projects, tasks, etc.)
5. Offer to open, update, or link any of the found notes

Do not just return filenames — return enough context for the user to act.

---

### `/obsidian-recap [today|week|month]`

**Summarizes a time period from the vault.**

Steps:
1. Determine the date range from the argument (default: `week` if not specified)
2. List all daily notes in the range with `list_files_in_dir("Daily/")`
3. Spawn parallel subagents — one per daily note — to read and extract key points from each simultaneously
4. Also spawn parallel agents to read dev logs and completed kanban tasks from the same period
5. Synthesize all agent results: what was worked on, decisions made, people interacted with, tasks completed, ideas captured
6. Present as a clean narrative summary — not a raw dump of note content

---

### `/obsidian-review`

**Generates a structured weekly or monthly review note.**

Steps:
1. Ask: weekly or monthly? (or infer from context)
2. Read daily notes and dev logs for the period
3. Read active projects and check for status changes
4. Read completed tasks from kanban boards
5. Draft a review note using `Templates/Review.md` if it exists, otherwise use a standard structure:
   - What I accomplished
   - Key decisions made
   - People I worked with
   - What I learned
   - What to carry forward
6. Save to `Reviews/YYYY-MM-DD — Weekly Review.md` (or Monthly)
7. Link from the last daily note of the period

---

### `/obsidian-board [optional: board name]`

**Shows or updates a kanban board.**

Steps:
1. If a board name is given, search `Boards/` for it (fuzzy match)
2. If no name given, list available boards and ask which one
3. Read and display the current board state: columns, item counts, overdue items (past `@{date}`)
4. Ask if the user wants to make updates — if yes, infer changes from conversation context
5. Move completed items to ✅ Done with strikethrough, add new items in the right column
6. Flag any items that are overdue or have been in the same column for more than a week

---

### `/obsidian-project [name]`

**Creates or updates a project note.**

Steps:
1. Search the vault for an existing project matching the name (fuzzy — handle typos)
2. If found: show what was found, confirm, then update with new info from conversation
3. If not found: create `Projects/Project Name.md` with full frontmatter schema (`date`, `tags: [project]`, `status: active`, `job`)
4. Fill in everything inferable from the conversation: description, goals, key people, current status
5. Add a card to the relevant kanban board in the `📥 Backlog` or `🔨 In Progress` column
6. Link from today's daily note

---

### `/obsidian-health`

**Runs a vault health check and summarizes findings.**

Steps:
1. Run: `python scripts/vault_health.py --path ~/path/to/vault --json`
2. Parse the JSON output and split findings into categories
3. Spawn parallel subagents to handle each category simultaneously:
   - **Links agent**: verify broken links, attempt to resolve them
   - **Duplicates agent**: confirm duplicates are truly the same concept, not just similar names
   - **Frontmatter agent**: identify notes missing required fields by type
   - **Staleness agent**: check overdue tasks and unfilled template syntax
   - **Orphans agent**: check orphaned notes and empty folders
4. Merge agent results and group by severity:
   - 🔴 Critical: broken links, unfilled template syntax
   - 🟡 Warning: duplicates, stale tasks, missing frontmatter
   - ⚪ Info: orphaned notes, empty folders
5. Present a clean summary with counts per category
6. For safe fixes (missing frontmatter, obvious duplicates), offer to fix them automatically
7. For destructive fixes (archiving, merging), list them and ask for explicit confirmation before touching anything

---

### `/obsidian-init`

**Bootstraps `_CLAUDE.md` for the vault — the operating manual.**

Steps:
1. Call `list_files_in_vault()` to map the full structure
2. Spawn parallel subagents to discover vault context simultaneously:
   - **Dashboard agent**: read `Home.md` or equivalent dashboard
   - **Templates agent**: read all files in `Templates/`
   - **Boards agent**: read all files in `Boards/`
   - **Samples agent**: read one existing note per major folder to capture naming conventions and frontmatter patterns
3. Merge all agent results into a complete picture of the vault
4. Generate a complete `_CLAUDE.md` using the template in `references/claude-md-template.md`, filled with real values from the vault
5. Write it to `_CLAUDE.md` at the vault root via `append_content("_CLAUDE.md", content)`
6. Confirm what was written and tell the user to restart their Claude session so the new file takes effect

If `_CLAUDE.md` already exists: show a diff of what would change and ask before overwriting.

---

## Scheduled Agents

Four autonomous agents designed to run on a schedule with no user intervention. Each runs a focused vault operation at a set time, then stops. They are conservative by default — they never delete or archive anything autonomously, and they never ask the user questions mid-run.

Set these up once using the `/schedule` skill in Claude Code.

---

### `obsidian-morning` — Daily at 8:00 AM

**Creates today's daily note and surfaces what needs attention.**

Prompt to schedule:
```
Read _CLAUDE.md. Create today's daily note in Daily/ using the Daily Note template.
Pull in any tasks from kanban boards that are due today or overdue.
List any projects with status active that have no recent activity in the last 7 days.
Do not ask questions — infer everything from the vault. Save and stop.
```

Setup:
```
/schedule obsidian-morning — daily 8:00 AM
```

---

### `obsidian-nightly` — Daily at 10:00 PM

**Closes out the day — saves anything unsaved, updates the daily note.**

Prompt to schedule:
```
Read _CLAUDE.md. Read today's daily note in Daily/.
Scan the current session context for anything worth saving that hasn't been logged yet:
decisions, tasks completed, people mentioned, ideas discussed.
Append a ## End of Day section to today's daily note with a 3-5 bullet summary of the day.
Move any completed kanban tasks to the Done column if not already done.
Do not ask questions. Save and stop.
```

Setup:
```
/schedule obsidian-nightly — daily 10:00 PM
```

---

### `obsidian-weekly` — Every Friday at 6:00 PM

**Generates a weekly review note from the vault.**

Prompt to schedule:
```
Read _CLAUDE.md. Run /obsidian-recap week to gather this week's activity.
Generate a weekly review note using the Review template (or standard structure if none exists).
Save to Reviews/YYYY-MM-DD — Weekly Review.md.
Link it from this week's last daily note.
Do not ask questions. Save and stop.
```

Setup:
```
/schedule obsidian-weekly — every Friday 6:00 PM
```

---

### `obsidian-health-check` — Every Sunday at 9:00 PM

**Runs the vault health check and logs a report.**

Prompt to schedule:
```
Read _CLAUDE.md. Run: python scripts/vault_health.py --path ~/path/to/vault --json
Parse the output. Write a health report to Knowledge/Vault Health YYYY-MM-DD.md
summarizing findings by severity (critical, warning, info).
Do not fix anything autonomously — only report.
Do not ask questions. Save and stop.
```

Setup:
```
/schedule obsidian-health-check — every Sunday 9:00 PM
```

---

### Setting up scheduled agents

All four can be configured at once:

```
/schedule
```

Then tell Claude which agents you want and at what times. Claude Code's scheduling system will handle the rest — agents run autonomously in the background on the defined cron schedule.

To list or remove scheduled agents:
```
/schedule list
/schedule remove obsidian-morning
```

---

## Reference Files

- `references/vault-schema.md` — Complete folder structure + frontmatter specs for all note types
- `references/write-rules.md` — Detailed writing, linking, and formatting rules
- `references/claude-md-template.md` — Template for generating a vault's `_CLAUDE.md`

## Scripts

- `scripts/bootstrap_vault.py` — Bootstrap a complete vault from scratch
- `scripts/vault_health.py` — Audit a vault for structural issues
