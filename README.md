<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-Skill-blueviolet?style=for-the-badge&logo=anthropic" alt="Claude Code Skill" />
  <img src="https://img.shields.io/badge/Obsidian-Plugin_Ready-7C3AED?style=for-the-badge&logo=obsidian&logoColor=white" alt="Obsidian" />
  <img src="https://img.shields.io/github/v/release/eugeniughelbur/obsidian-second-brain?style=for-the-badge&color=green" alt="Release" />
  <img src="https://img.shields.io/github/license/eugeniughelbur/obsidian-second-brain?style=for-the-badge" alt="License" />
  <img src="https://img.shields.io/github/stars/eugeniughelbur/obsidian-second-brain?style=for-the-badge&color=yellow" alt="Stars" />
</p>

<h1 align="center">obsidian-second-brain</h1>

<p align="center">
  <strong>Your Obsidian vault is dead weight. This skill makes it alive.</strong>
  <br />
  <em>22 commands &middot; 4 thinking tools &middot; self-rewriting knowledge base &middot; 4 scheduled agents</em>
  <br /><br />
  <a href="#what-happens-when-you-install-this">See it in action</a> &middot;
  <a href="#the-three-layers">Architecture</a> &middot;
  <a href="#commands-at-a-glance">All 22 commands</a> &middot;
  <a href="#install">Install in 2 minutes</a> &middot;
  <a href="https://github.com/eugeniughelbur/obsidian-second-brain/discussions">Discussions</a>
</p>

---

## The Problem Nobody Talks About

You use Claude every day. But every session starts from scratch. You re-explain your project, your role, your preferences. The conversation ends. Everything disappears.

You take notes in Obsidian. Hundreds of markdown files. But they just sit there. You make the same decision twice because you forgot you made it six months ago. Ideas rot in daily notes. Patterns repeat across projects because nobody connects the dots.

Two of the most powerful tools in your stack. Completely disconnected.

---

## What Happens When You Install This

**You finish a meeting.** Type `/obsidian-save`. Claude scans the entire conversation, pulls out every decision, person, task, and idea, and saves each one to the right note. Project notes get updated. Kanban boards get new cards. Today's daily note links to everything. You did nothing.

**You find a great article.** Type `/obsidian-ingest` with the URL. Claude doesn't just summarize it into one note. It REWRITES your existing pages. A person mentioned in the article? Their entity page gets updated with new context. A concept that contradicts something in your vault? Resolved. Patterns across sources? New synthesis pages created automatically. One URL in. The vault is smarter, not just bigger.

**You're about to make a big decision.** Type `/obsidian-challenge`. Claude searches your own vault for past failures, contradictions, and reversed decisions on the same topic. It pushes back with your own words. Your vault holds you accountable.

**You wake up Monday.** Your morning briefing is already written. The nightly agent closed out Friday. The weekly review generated itself. The health check ran Sunday and flagged two stale projects.

**You haven't opened Obsidian once.** Everything happened through Claude.

---

## Who Is This For?

| You are... | This gives you... |
|---|---|
| **A founder** | A chief of staff that remembers every decision, challenges your thinking with your own history, and never forgets a follow-up |
| **A developer** | Auto-generated dev logs, session continuity, and a vault that links code decisions to project notes without effort |
| **A knowledge worker** | Zero-friction capture, self-writing weekly reviews, and a vault that detects its own contradictions |
| **Anyone using Claude daily** | Persistent memory across every session. You never re-explain who you are again. |

---

## How It Compares

| | Doing it manually | Generic AI chat | **This skill** |
|---|---|---|---|
| Saving decisions | Copy-paste into notes | Lost when chat ends | Auto-saved to the right project note |
| Daily notes | Write it yourself | N/A | Created and updated automatically |
| Finding patterns | Re-read dozens of notes | Hallucinated patterns | `/emerge` -- grounded in your actual notes |
| Challenging assumptions | Hope someone pushes back | AI agrees with everything | `/challenge` -- your own history argues against you |
| Session continuity | Re-explain every time | Memory is unreliable | `/world` -- full context, one command |
| Ingesting content | Read it, forget it | Summarize into 1 note | `/ingest` -- 1 source rewrites 5-15 vault pages |
| Vault maintenance | Manual cleanup | N/A | Background agent + scheduled health checks |
| Contradictions | You don't know they exist | N/A | `/reconcile` -- the vault resolves its own conflicts |

---

## The Three Layers

```
  +-----------------------------------------+
  |        obsidian-second-brain             |
  +-----------------------------------------+
  |                                         |
  |   LAYER 1: Vault Operations (17 cmds)   |
  |   "Claude remembers"                    |
  |   save, daily, log, task, person,       |
  |   decide, capture, find, recap, review, |
  |   board, project, health, init,         |
  |   ingest, adr, reconcile               |
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
| `/obsidian-save` | Scans the whole conversation and saves everything worth keeping -- decisions, tasks, people, ideas -- all at once |
| `/obsidian-ingest` | Drop a URL, PDF, or transcript. The vault REWRITES itself -- updates entities, resolves contradictions, synthesizes patterns. 5-15 pages touched per source. |
| `/obsidian-reconcile` | Scans the vault for contradictions and resolves them. The vault maintains its own truth. |
| `/obsidian-daily` | Creates or updates today's daily note from conversation context |
| `/obsidian-log` | Logs a work session -- infers the project, writes the log, links it everywhere |
| `/obsidian-task [desc]` | Adds a task to the right kanban board with inferred priority and due date |
| `/obsidian-person [name]` | Creates or updates a person note; logs the interaction |
| `/obsidian-decide [topic]` | Extracts decisions and logs them in the right project's Key Decisions section |
| `/obsidian-capture [idea]` | Zero-friction idea capture |
| `/obsidian-find [query]` | Smart search -- returns context, not just filenames |
| `/obsidian-recap [period]` | Narrative summary of a day, week, or month |
| `/obsidian-review` | Generates a structured weekly or monthly review |
| `/obsidian-board [name]` | Shows kanban state, flags overdue items |
| `/obsidian-project [name]` | Creates or updates a project note with board and daily links |
| `/obsidian-health` | Vault audit -- broken links, contradictions, concept gaps, stale claims, duplicates, orphans |
| `/obsidian-adr` | Decision records -- the vault knows why it's structured this way |
| `/obsidian-init` | Scans your vault and generates `_CLAUDE.md`, `index.md`, and `log.md` |

Every command searches before creating (no duplicates), propagates to every linked note (no orphans), and handles typos with fuzzy matching.

<details>
<summary><strong>See /obsidian-ingest in action</strong></summary>

<br />

```
/obsidian-ingest https://youtube.com/watch?v=example
```

Claude detects it's a YouTube video, pulls the full transcript and metadata (via `yt-dlp` in Claude Code, MCP tools in Desktop, or user paste as fallback), then:

1. Saves original to `raw/videos/` (immutable -- never touched again)
2. REWRITES `wiki/entities/Speaker.md` with new context (integrates, not appends)
3. REWRITES `wiki/concepts/Existing Concept.md` if the source adds depth or contradicts it
4. Creates new synthesis pages when patterns emerge across existing knowledge
5. Resolves contradictions: video says X but vault says Y? Vault picks the winner and documents why
6. Rebuilds `index.md`, appends to `log.md`, updates today's daily note

**One URL in. The vault rewrites itself.** Not just bigger. Different.

</details>

---

### Layer 2: Thinking Tools

> This is what makes this skill different from everything else. These commands don't organize. They generate insight you can't get on your own.

| Command | What it does |
|---|---|
| `/obsidian-challenge` | Red-teams your idea against your own vault history |
| `/obsidian-emerge` | Surfaces unnamed patterns from your last 30 days of notes |
| `/obsidian-connect [A] [B]` | Bridges two unrelated domains to spark new ideas |
| `/obsidian-graduate` | Promotes an idea fragment into a full project with tasks and structure |

<details>
<summary><strong>See examples</strong></summary>

<br />

**`/obsidian-challenge`** -- Your vault argues with you.

You say: *"I want to rewrite the API in Rust."*

Claude finds your 2025 post-mortem where you abandoned a Rust rewrite. Finds your decision log where you committed to TypeScript for 2 years. Presents the evidence: *"Your own notes say this failed last time. Still want to proceed?"*

---

**`/obsidian-emerge`** -- Your vault tells you what you can't see.

Claude scans 30 daily notes. Finds you mentioned "onboarding friction" in 4 unrelated client projects without ever naming it as a systemic issue.

*"You have a pattern: onboarding is your bottleneck across projects. You never named it."*

---

**`/obsidian-connect`** -- Your vault bridges domains.

`/obsidian-connect "distributed systems" "cooking"`

Claude traces both clusters in your link graph. Finds shared concepts: preparation and load distribution. Generates 3 actionable ideas at the intersection -- grounded in your own notes.

---

**`/obsidian-graduate`** -- Your vault turns ideas into projects.

An idea captured 3 weeks ago is ready. Claude reads it, researches your vault for related projects and people, generates a full spec with goals, phases, tasks, and board entries. The idea note gets tagged `graduated`. Nothing dies in your inbox.

</details>

---

### Layer 3: Context Engine

> Every session picks up where the last one ended.

| Command | What it does |
|---|---|
| `/obsidian-world` | Loads your identity, values, priorities, and current state with progressive token budgets (L0-L3) |

Start any session. Run `/obsidian-world`. Claude reads your identity file, checks your last 3 daily notes, scans your boards:

> *"You're focused on the API launch (due Friday). You left off debugging the auth middleware last night. 2 overdue tasks on the Marketing board."*

No re-explaining. No memory issues. Full context in 10 seconds.

---

## The Vault is Alive

This is what separates this skill from a note-taking plugin.

Traditional vaults are filing cabinets. You put things in. They sit there. The more notes you add, the harder it gets to find anything.

This vault is a living knowledge base. Every input makes it smarter:

- **Ingest a source** -- existing pages get rewritten, contradictions get resolved, patterns get synthesized
- **Save a conversation** -- every entity, concept, and decision distributes across the vault
- **Ask a question** -- the Two-Output Rule means every answer also updates relevant pages
- **Do nothing** -- the background agent and scheduled agents maintain the vault while you sleep

The vault after a week of use is fundamentally different from the vault you started with. Not just bigger. Rewired.

---

## Background Agent

Fires after every context compaction. No user action needed.

```
PostCompact -> obsidian-bg-agent.sh -> claude -p (headless) -> vault updated
```

You keep working. The vault updates itself.

---

## Scheduled Agents

| Agent | When | What it does |
|---|---|---|
| `obsidian-morning` | Daily 8 AM | Creates daily note, surfaces overdue tasks |
| `obsidian-nightly` | Daily 10 PM | Closes out the day, moves completed tasks |
| `obsidian-weekly` | Fridays 6 PM | Generates weekly review |
| `obsidian-health-check` | Sundays 9 PM | Vault health audit |

Set up once: `/schedule`

---

## Parallel Subagents

Complex commands spawn parallel agents and merge results.

| Command | Agents |
|---|---|
| `/obsidian-save` | People + Projects + Tasks + Decisions + Ideas |
| `/obsidian-ingest` | Entities + Concepts + Projects + Contradictions |
| `/obsidian-reconcile` | Claims + Entities + Decisions + Source Freshness |
| `/obsidian-challenge` | Decisions + Failures + Contradictions |
| `/obsidian-emerge` | Daily notes + Dev logs + Decisions + Ideas |
| `/obsidian-health` | Links + Duplicates + Frontmatter + Staleness + Orphans + Contradictions + Gaps + Stale Claims |

---

## Vault Architecture

Two styles. Choose at bootstrap.

### Wiki-style (default) -- LLM-first

The vault is a database. Claude is the reader and writer. You interact through Claude, not Obsidian.

```
vault/
+-- _CLAUDE.md        # Operating manual
+-- index.md          # Page catalog (Claude reads FIRST)
+-- log.md            # Activity timeline
+-- SOUL.md           # Your identity
+-- raw/              # IMMUTABLE. Claude reads, never writes.
|   +-- articles/, transcripts/, pdfs/, videos/
+-- wiki/             # Claude's workspace
|   +-- entities/     # People, companies, tools
|   +-- concepts/     # Ideas, frameworks
|   +-- projects/, daily/, logs/, reviews/
|   +-- tasks/, decisions/
+-- boards/, templates/
```

### Obsidian-style (alternative) -- for daily browsers

```
vault/
+-- Daily/, Projects/, People/, Ideas/, Knowledge/
+-- Dev Logs/, Tasks/, Reviews/, Boards/, Templates/
```

```bash
# Wiki-style (default)
python bootstrap_vault.py --path ~/my-vault --name "Your Name"

# Obsidian-style
python bootstrap_vault.py --path ~/my-vault --name "Your Name" --style obsidian
```

---

## Install

Two commands.

```bash
git clone https://github.com/eugeniughelbur/obsidian-second-brain ~/.claude/skills/obsidian-second-brain
bash ~/.claude/skills/obsidian-second-brain/scripts/setup.sh "/path/to/your/vault"
```

Then: `/obsidian-init`

Claude scans your vault and generates `_CLAUDE.md` -- its operating manual for your specific vault.

<details>
<summary><strong>New vault? Bootstrap from scratch.</strong></summary>

```bash
python ~/.claude/skills/obsidian-second-brain/scripts/bootstrap_vault.py \
  --path ~/my-vault --name "Your Name" --jobs "Company"
```

Creates folders, templates, kanban boards, Home dashboard, and a ready-to-use `_CLAUDE.md`.

</details>

---

## Philosophy

Most second brain tools make you the janitor. You spend more time organizing than thinking.

This skill inverts that. You think, work, and talk. Claude handles the memory. And then it uses that memory to make you think better.

Every source you ingest rewrites existing pages and synthesizes new ones. Every decision you log becomes evidence for `/challenge`. Every idea you capture becomes a candidate for `/graduate`. The vault doesn't grow. It evolves.

Everyone will have access to the same AI models. The differentiator is what you feed them. Years of interlinked personal writing. Decisions logged. Lessons captured. That compounds. Generic prompts don't.

**Your notes are the moat.**

Inspired by [Andrey Karpathy's LLM-Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) -- persistent, compounding knowledge bases maintained by LLMs.

---

## Recommended Plugins

| Plugin | Why |
|---|---|
| [Dataview](https://github.com/blacksmithgu/obsidian-dataview) | Dashboard queries |
| [Templater](https://github.com/SilentVoid13/Templater) | Note templates |
| [Kanban](https://github.com/mgmeyers/obsidian-kanban) | Board management |
| [Calendar](https://github.com/liamcain/obsidian-calendar-plugin) | Daily note navigation |

---

## Contributing

PRs welcome:
- New thinking tools
- Note type schemas (habits, books, investments)
- MCP integrations (Calendar, Linear, Slack)
- Alternative vault structures
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
