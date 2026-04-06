<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-Skill-blueviolet?style=for-the-badge&logo=anthropic" alt="Claude Code Skill" />
  <img src="https://img.shields.io/badge/Obsidian-Plugin_Ready-7C3AED?style=for-the-badge&logo=obsidian&logoColor=white" alt="Obsidian" />
  <img src="https://img.shields.io/github/v/release/eugeniughelbur/obsidian-second-brain?style=for-the-badge&color=green" alt="Release" />
  <img src="https://img.shields.io/github/license/eugeniughelbur/obsidian-second-brain?style=for-the-badge" alt="License" />
  <img src="https://img.shields.io/github/stars/eugeniughelbur/obsidian-second-brain?style=for-the-badge&color=yellow" alt="Stars" />
</p>

<h1 align="center">obsidian-second-brain</h1>

<p align="center">
  <strong>Turn your Obsidian vault into a personal AI operating system.</strong>
  <br />
  <em>22 commands &middot; 4 thinking tools &middot; living knowledge base &middot; 4 scheduled agents &middot; 1 background agent</em>
  <br /><br />
  <a href="#install">Install</a> &middot;
  <a href="#the-three-layers">Features</a> &middot;
  <a href="#commands-at-a-glance">Commands</a> &middot;
  <a href="#scheduled-agents--claude-works-while-you-sleep">Agents</a> &middot;
  <a href="#contributing">Contributing</a> &middot;
  <a href="https://github.com/eugeniughelbur/obsidian-second-brain/discussions">Discussions</a>
</p>

<!-- 
  TODO: Add a demo GIF here for maximum impact.
  Record a 30-second screen capture of /obsidian-save or /obsidian-challenge in action.
  Tools: CleanShot X, Kap, or OBS. Upload to the repo and uncomment below.
  
  <p align="center">
    <img src="assets/demo.gif" alt="Demo" width="800" />
  </p>
-->

---

## Who Is This For?

| You are... | This skill gives you... |
|---|---|
| **A founder or operator** | A personal chief of staff that remembers every decision, tracks every project, and challenges your thinking with your own history |
| **A developer** | Automatic dev logs, session continuity, and a vault that links code decisions to project notes without you lifting a finger |
| **A knowledge worker** | Zero-friction capture from every conversation, weekly reviews that write themselves, and a vault that never has orphaned notes |
| **Anyone who uses Claude daily** | Persistent memory across sessions, so you never re-explain who you are or what you're working on |

If you take notes in Obsidian and use Claude, this skill is the bridge between the two.

---

## The Problem

You use Claude every day. But every session starts from zero. You re-explain your project, your context, your preferences. The conversation ends and everything is lost.

You take notes in Obsidian. But they sit there. Decisions get made and forgotten. You write the same lesson twice because you can't find the first one. Ideas stay in daily notes forever. Nobody connects the dots.

**Two powerful tools. Zero connection between them.**

## The Solution

This skill connects them. Your vault becomes Claude's long-term memory. Claude becomes your vault's brain.

> **You talk. Claude remembers.** Finish a conversation, type `/obsidian-save`. Every decision, person, task, and idea gets saved to the right note — automatically. You do nothing.
>
> **You drop a link. Claude learns.** Type `/obsidian-ingest` with a YouTube video, article, or PDF. Claude extracts every person, concept, and insight and distributes them across 5-15 vault pages. One source in, knowledge everywhere.
>
> **You ask. Your vault argues back.** Type `/obsidian-challenge`. Claude searches your own history for contradictions, past failures, and reversed decisions — then pushes back with your own words. This isn't generic AI. This is your vault holding you accountable.
>
> **You sleep. Claude maintains.** Scheduled agents create your morning briefing, close out your day, write your weekly review, and audit your vault for rot. A background agent fires after every compaction and silently updates your vault while you keep working.

---

## How It Compares

| | Doing it manually | Generic AI chat | **obsidian-second-brain** |
|---|---|---|---|
| Saving decisions from conversations | Copy-paste into notes yourself | Lost when chat ends | Auto-saved to the right project note |
| Keeping daily notes current | Write it yourself, forget half the time | N/A | Created and updated automatically |
| Finding patterns across weeks | Re-read dozens of notes | Hallucinated patterns | `/obsidian-emerge` — grounded in your actual notes |
| Challenging your own assumptions | Hope someone pushes back | AI agrees with everything | `/obsidian-challenge` — uses your own vault history against you |
| Session continuity | Re-explain everything each time | Memory is unreliable | `/obsidian-world` — full context in one command |
| Vault maintenance | Manual weekly cleanup | N/A | Background agent + scheduled health checks |
| Cross-domain idea generation | Rare flashes of insight | Generic brainstorming | `/obsidian-connect` — traces your vault's link graph |
| Ingesting external content | Read it, forget it | Summarize into 1 note | `/obsidian-ingest` — 1 source becomes 5-15 interconnected vault pages |
| Knowing why your vault is structured this way | You don't remember | N/A | `/obsidian-adr` — decision records for every structural change |

---

## The Three Layers

```
  +-----------------------------------------+
  |        obsidian-second-brain             |
  +-----------------------------------------+
  |                                         |
  |   LAYER 1: Vault Operations (16 cmds)   |
  |   "Claude remembers"                    |
  |   save, daily, log, task, person,       |
  |   decide, capture, find, recap, review, |
  |   board, project, health, init,         |
  |   ingest, adr                           |
  +-----------------------------------------+
  |                                         |
  |   LAYER 2: Thinking Tools (4 cmds)      |
  |   "Claude thinks with you"              |
  |   challenge - argue against your ideas  |
  |   emerge    - find what you can't see   |
  |   connect   - bridge unrelated domains  |
  |   graduate  - idea -> full project      |
  +-----------------------------------------+
  |                                         |
  |   LAYER 3: Context Engine (1 cmd)       |
  |   "Claude knows you"                    |
  |   world - identity + state (L0-L3)      |
  +-----------------------------------------+
  |                                         |
  |   ALWAYS ON                             |
  |   Background Agent (PostCompact hook)   |
  |   4 Scheduled Agents (cron)             |
  |   Two-Output Rule (auto vault updates)  |
  |   index.md + log.md (navigation + log)  |
  +-----------------------------------------+
```

---

## Commands at a Glance

### Layer 1: Vault Operations

> Claude remembers everything. You never think about where to save something.

| Command | What it does |
|---|---|
| `/obsidian-save` | Scans your entire conversation and saves everything worth keeping — decisions, tasks, people, ideas — all at once |
| `/obsidian-daily` | Creates or updates today's daily note, pre-filled from conversation context |
| `/obsidian-log` | Logs a work session — infers the project, writes the log, links it everywhere |
| `/obsidian-task [desc]` | Adds a task to the right kanban board with inferred priority and due date |
| `/obsidian-person [name]` | Creates or updates a person note; logs the interaction in the daily note |
| `/obsidian-decide [topic]` | Extracts decisions and logs them in the right project's Key Decisions section |
| `/obsidian-capture [idea]` | Zero-friction idea capture to Ideas/ |
| `/obsidian-find [query]` | Smart search — returns context, not just filenames |
| `/obsidian-recap [period]` | Narrative summary of a day, week, or month |
| `/obsidian-review` | Generates a structured weekly or monthly review |
| `/obsidian-board [name]` | Shows kanban state, flags overdue items |
| `/obsidian-project [name]` | Creates or updates a project note with board and daily links |
| `/obsidian-health` | Vault audit — duplicates, orphans, broken links, contradictions, concept gaps, stale claims |
| `/obsidian-adr` | Generate a decision record when vault structure changes — the vault knows why it's organized this way |
| `/obsidian-init` | Scans your vault and generates `_CLAUDE.md`, `index.md`, and `log.md` |
| `/obsidian-ingest` | Ingests a source — the vault REWRITES itself around new knowledge. Creates, updates, and resolves contradictions across 5-15 pages |
| `/obsidian-reconcile` | Finds contradictions across the vault and resolves them — the vault maintains its own truth |

Every command searches before creating (no duplicates), propagates to every linked note (no orphans), and handles typos with fuzzy matching.

<details>
<summary><strong>See /obsidian-ingest in action</strong></summary>

<br />

```
/obsidian-ingest https://youtube.com/watch?v=example
```

Claude detects it's a YouTube video, pulls full metadata and transcript (via `yt-dlp` in Claude Code, MCP tools in Claude Desktop, or oEmbed + user paste as fallback), then:

1. Saves original to `raw/videos/` (immutable — never touched again)
2. REWRITES `wiki/entities/Speaker Name.md` with new context (not just appends — integrates)
3. REWRITES `wiki/concepts/Existing Concept.md` if the source adds depth or contradicts it
4. Creates new concept pages if the source reveals patterns across existing knowledge
5. Resolves contradictions: if the video says X but an existing page says Y, the vault picks the winner and documents why
6. Rebuilds `index.md`, appends to `log.md`, updates today's daily note

**One URL in. The vault rewrites itself.** Pages that existed before are now smarter, more connected, and more current. Not just bigger — different.

</details>

---

### Layer 2: Thinking Tools

> This is what makes this skill different. These commands don't organize — they generate insight.

| Command | What it does |
|---|---|
| `/obsidian-challenge` | Red-teams your idea against your own vault history |
| `/obsidian-emerge` | Surfaces unnamed patterns from your last 30 days of notes |
| `/obsidian-connect [A] [B]` | Bridges two unrelated domains to spark new ideas |
| `/obsidian-graduate` | Promotes an idea fragment into a full project with tasks and structure |

<details>
<summary><strong>See examples</strong></summary>

<br />

**`/obsidian-challenge`**

You say: *"I want to rewrite the API in Rust."*

Claude searches your vault, finds your 2025 post-mortem where you abandoned a Rust rewrite due to hiring constraints, and your decision log where you committed to TypeScript for 2 years. It presents the counter-evidence and asks: *"Still want to proceed?"*

This is your vault arguing with you — using your own words.

---

**`/obsidian-emerge`**

After a busy month, Claude scans 30 daily notes and finds you mentioned "onboarding friction" in 4 different client projects without ever naming it as a problem.

It surfaces: *"You have an unnamed pattern — onboarding is your bottleneck across projects, not a one-off issue."*

These are conclusions your notes already contain but you never stated.

---

**`/obsidian-connect "distributed systems" "cooking"`**

Claude traces both clusters in your link graph and finds shared concepts around preparation and load distribution. It generates 3 concrete ideas at the intersection — not vague analogies, but actionable concepts grounded in your own notes.

---

**`/obsidian-graduate`**

An idea you captured 3 weeks ago is ready to become real. Claude reads the idea note, researches your vault for related projects and people, and generates a full project spec with goals, phases, tasks, and board entries.

The idea note gets tagged `graduated` and linked to the new project. Nothing dies in your inbox.

</details>

---

### Layer 3: Context Engine

> Every session picks up where you left off.

| Command | What it does |
|---|---|
| `/obsidian-world` | Loads identity, values, priorities, and state with progressive token budgets (L0-L3) |

Run `/obsidian-world` at the start of any session. Claude reads your `SOUL.md`, checks your last 3 daily notes, scans your boards, and reports:

> *"You're focused on the API launch (due Friday), you left off debugging the auth middleware last night, and you have 2 overdue tasks on the Marketing board."*

No re-explaining. No context loss.

---

## Background Agent

The most hands-off feature. Fires automatically after every context compaction — no user action needed.

```
PostCompact -> obsidian-bg-agent.sh -> claude -p (headless) -> vault updated
```

A headless Claude subprocess wakes up, reads `_CLAUDE.md`, scans the session summary, and writes updates everywhere they belong. You keep working. The vault updates itself.

---

## Scheduled Agents — Claude works while you sleep

| Agent | When | What it does |
|---|---|---|
| `obsidian-morning` | Daily 8 AM | Creates today's daily note, surfaces overdue tasks and stale projects |
| `obsidian-nightly` | Daily 10 PM | Closes out the day, appends a summary, moves completed tasks to Done |
| `obsidian-weekly` | Fridays 6 PM | Generates a weekly review from the week's activity |
| `obsidian-health-check` | Sundays 9 PM | Runs a vault health audit and saves a report |

Set up once: `/schedule`

---

## Parallel Subagents

Complex commands spawn parallel subagents — one per task group — and merge results when all finish.

| Command | What runs in parallel |
|---|---|
| `/obsidian-save` | People + Projects + Tasks + Decisions + Ideas |
| `/obsidian-challenge` | Decisions + Failures + Contradictions |
| `/obsidian-emerge` | Daily notes + Dev logs + Decisions + Ideas |
| `/obsidian-health` | Links + Duplicates + Frontmatter + Staleness + Orphans + Contradictions + Concept Gaps + Stale Claims |
| `/obsidian-recap` | One agent per daily note in the range |
| `/obsidian-init` | Dashboard + Templates + Boards + Samples |
| `/obsidian-ingest` | Entities + Concepts + Projects + Contradictions |
| `/obsidian-reconcile` | Claims + Entities + Decisions + Source Freshness |

---

## Vault Architecture

Two styles. Pick the one that matches how you work.

### Wiki-style (default) — for LLM-first users

Claude does most or all of the writing. You interact through Claude, not Obsidian. The vault is a database.

```
Your Vault/
+-- _CLAUDE.md        # Operating manual
+-- index.md          # Page catalog (Claude reads FIRST)
+-- log.md            # Activity timeline
+-- SOUL.md           # Your identity
|
+-- raw/              # IMMUTABLE. Claude reads, never writes.
|   +-- articles/     # Original source material
|   +-- transcripts/  # Meeting notes, podcasts
|   +-- pdfs/         # Documents
|   +-- videos/       # YouTube metadata + transcripts
|
+-- wiki/             # Claude's workspace
|   +-- entities/     # People, companies, tools (flat)
|   +-- concepts/     # Ideas, frameworks
|   +-- projects/     # Project notes
|   +-- daily/        # Daily notes
|   +-- logs/         # Dev/work logs
|   +-- reviews/      # Weekly/monthly reviews
|   +-- tasks/        # Task notes
|   +-- decisions/    # ADRs
|
+-- boards/           # Kanban boards
+-- templates/        # Note templates
```

`raw/` is the source of truth. Claude never touches it. If a wiki page gets corrupted, re-derive from raw. `wiki/` is Claude's workspace. Every entity, concept, and project lives here. `index.md` is the front door — Claude reads it first, navigates from there.

### Obsidian-style (alternative) — for users who browse daily

```
Your Vault/
+-- _CLAUDE.md, index.md, log.md, Home.md
+-- Daily/, Projects/, People/, Ideas/, Knowledge/
+-- Dev Logs/, Tasks/, Reviews/, Boards/, Templates/
```

Traditional folders for human spatial memory. Same commands, same features — just different folder layout.

Choose at bootstrap:
```bash
# Wiki-style (default)
python bootstrap_vault.py --path ~/my-vault --name "Your Name"

# Obsidian-style
python bootstrap_vault.py --path ~/my-vault --name "Your Name" --style obsidian
```

---

## Install

Two commands. That's it.

```bash
# 1. Clone the skill
git clone https://github.com/eugeniughelbur/obsidian-second-brain ~/.claude/skills/obsidian-second-brain

# 2. Run setup (wires the hook, sets vault path, optionally configures MCP)
bash ~/.claude/skills/obsidian-second-brain/scripts/setup.sh "/path/to/your/vault"
```

Then run:

```
/obsidian-init
```

Claude scans your vault and generates a `_CLAUDE.md` — its operating manual for your specific vault.

<details>
<summary><strong>Bootstrap a new vault from scratch</strong></summary>

<br />

```bash
python ~/.claude/skills/obsidian-second-brain/scripts/bootstrap_vault.py \
  --path ~/my-vault \
  --name "Your Name" \
  --jobs "Company Name"
```

Creates a complete vault with folders, templates, kanban boards, a Home dashboard, and a pre-filled `_CLAUDE.md`. Then run `setup.sh` pointing at the new path.

</details>

---

## Recommended Obsidian Plugins

| Plugin | Why |
|---|---|
| [Dataview](https://github.com/blacksmithgu/obsidian-dataview) | Powers the Home dashboard queries |
| [Templater](https://github.com/SilentVoid13/Templater) | Powers the Templates/ folder |
| [Kanban](https://github.com/mgmeyers/obsidian-kanban) | Powers the Boards/ folder |
| [Calendar](https://github.com/liamcain/obsidian-calendar-plugin) | Daily note navigation |

---

## Skill Structure

```
obsidian-second-brain/
+-- SKILL.md                        # Core instructions for Claude
+-- commands/                       # 21 slash commands
+-- hooks/                          # Background agent hook
+-- references/
|   +-- vault-schema.md             # Folder structure + frontmatter specs
|   +-- write-rules.md              # Writing, linking, and propagation rules
|   +-- claude-md-template.md       # Template for generating _CLAUDE.md
+-- scripts/
|   +-- setup.sh                    # One-command installer
|   +-- bootstrap_vault.py          # Bootstrap a vault from scratch
|   +-- vault_health.py             # Audit a vault for structural issues
```

---

## Philosophy

> Most second brain tools make you the janitor. You spend more time organizing than thinking.

This skill inverts that. You think, work, and talk. Claude handles the memory. And then it uses that memory to make you think better.

Every note you write gives Claude more context. Every decision you log becomes ammunition for `/obsidian-challenge`. Every idea you capture becomes a candidate for `/obsidian-graduate`. Every source you ingest spreads knowledge across 5-15 vault pages. The vault compounds. Not linearly -- exponentially.

Everyone will have access to the same AI models. The differentiator isn't the model. It's having years of interlinked personal writing for the model to work with.

**Your notes are the moat.**

Inspired by [Andrey Karpathy's LLM-Wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) -- the idea that LLMs should maintain persistent, compounding knowledge bases instead of re-deriving answers every time.

---

## Contributing

PRs welcome. Especially interested in:
- New thinking tools (novel ways to use vault data for insight)
- Note type schemas (habits, books, investments)
- MCP integrations (Calendar, Linear, Slack context in daily rituals)
- Alternative vault structures (GTD, PARA, Zettelkasten variants)
- VS Code / Cursor setup guides

---

## Author

Built by **Eugeniu Ghelbur**

[![X](https://img.shields.io/badge/X-@eugeniu__ghelbur-000000?style=flat-square&logo=x)](https://x.com/eugeniu_ghelbur)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-eugeniu--ghelbur-0A66C2?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/eugeniu-ghelbur/)
[![GitHub](https://img.shields.io/badge/GitHub-eugeniughelbur-181717?style=flat-square&logo=github)](https://github.com/eugeniughelbur/)

---

## License

MIT
