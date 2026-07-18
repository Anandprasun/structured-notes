# structured-notes

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Claude Skill](https://img.shields.io/badge/Claude-Skill-d97757)
![Status](https://img.shields.io/badge/status-v1.0.0-brightgreen)

A [Claude](https://claude.com) skill that turns raw, messy input — meeting scribbles, call/interview transcripts, or a stream-of-consciousness brain-dump — into a clean note you can understand **at a glance**, then **audits** it for what's missing and **verifies** its own facts against the source.

> Formatting is table stakes. The audit and the self-verification are the point.

---

## What it does

Give it a wall of rough text and it returns structured markdown:

- **Keyword line + TL;DR** on top — get the gist in seconds.
- **Decisions** and **action items** pulled into their own sections (task · owner · due) so commitments never get lost in prose.
- **Detail** underneath, grouped by topic and sorted by *actionability*, not the order things were said.

Then it does two passes a plain "summarize this" won't:

- **⚠ Accountability audit** — flags actions with no owner, commitments with no due date, decisions that got deferred, contradictions, unanswered questions, and things someone *implied* they'd do but never wrote down.
- **✓ Self-verification** — re-reads the source and confirms every number, name, date, and quote is exact; marks anything derived or uncertain.

It auto-detects the input type (meeting / transcript / brain-dump / reading notes) and adapts the body, while keeping one consistent spine.

## How is this different from just asking Claude to "tidy this up"?

Honestly? On any single focused request, Claude is already a great note-taker. The skill's value is the **floor and the guarantee, not the ceiling**:

| | Ask Claude in the moment | With this skill |
|---|---|---|
| Clean, glanceable formatting | Usually | **Every time** |
| Accountability audit (ownerless/dateless/contradictions) | Sometimes, if you ask | **Every time, by contract** |
| Self-verification of facts | ~Never unprompted | **Every time** |
| Consistent house format across notes | Varies run to run | **Identical spine every time** |

In testing, the skill ran an accurate self-verification on **100% of runs** vs **0%** for plain Claude — the exact gap where the unaided model once invented a date and a made-up dollar total. See [`evaluation/`](./evaluation).

## Example

<details>
<summary>Input (messy finance meeting) → click to see the output's audit + verification</summary>

```
## ⚠ Gaps & Risks
- Numbers don't hit the mandate: stated cuts are 100k + 80k + 60k = 240k
  against a 300k "non-negotiable" target — a 60k shortfall.
- Travel saving overstated: sales travel is exempt, so the real travel
  saving is below 80k, widening the gap further.
- Unresolved dependency: do contractor cuts kill the two dependent projects?

▶ Next best action: Close the 60k gap — the plan is 60k short at face value.

## ✓ Fidelity check
All figures verified against source (300k; 100k/80k/60k; 40k event).
Shortfall math (240k total, 60k short) is derived from the three stated figures.
```
</details>

More full input→output pairs are in [`examples/`](./examples).

## Install

### Claude Code — install straight from GitHub (recommended, nothing to copy)

This repo **is** a [Claude Code plugin marketplace](https://code.claude.com/docs/en/plugin-marketplaces). Point Claude Code at it and install:

```
/plugin marketplace add <your-username>/structured-notes
/plugin install structured-notes@prasun-skills
```

The first command registers this GitHub repo as a marketplace; the second installs the skill. It stays current with `/plugin marketplace update`. After installing, just paste your notes — the skill triggers itself. No prompt to copy, no files to move.

### Claude app / Cowork

Download the packaged [`dist/structured-notes.skill`](./dist/structured-notes.skill) and add it via your skills settings. (The apps don't yet install from a repo URL, so this is the file route.)

### Manual (any Claude setup with a `~/.claude/skills` folder)

```bash
git clone https://github.com/<your-username>/structured-notes.git
cp -r structured-notes/plugins/structured-notes/skills/structured-notes ~/.claude/skills/
```

### Other AIs (ChatGPT, Gemini, your own API)

**Heads up:** ChatGPT and Gemini have no way to install a skill from a GitHub repo — there's no import-from-URL for either. The skill's instructions are universal, though, so the portable prompt gives you identical behavior (structure, audit, and self-verification all carry over). You add it once to a Custom GPT / Gem and reuse it:

- The prompt: [`portable/PROMPT.md`](./portable/PROMPT.md)
- Per-platform steps + API snippets: [`portable/INSTALL.md`](./portable/INSTALL.md)
- One-page installer with a copy button and platform tabs: [`portable/install.html`](./portable/install.html)

## How it works (repo structure)

```
.claude-plugin/marketplace.json          # makes this repo installable as a marketplace
plugins/structured-notes/
├── .claude-plugin/plugin.json           # the plugin manifest
└── skills/structured-notes/
    ├── SKILL.md                         # the skill: router, spine, templates, audit, verification
    └── references/design-principles.md  # the research behind each design choice
portable/                                # PROMPT.md + INSTALL.md + install.html (any AI)
examples/                                # worked input → output pairs
evaluation/                             # test suite + result reports
dist/structured-notes.skill             # one-click build for the Claude app
```

The design borrows from best-in-class note tools and methods — Fireflies (keyword line), tl;dv (topic gists), Granola (decisions + strict actions), Progressive Summarization (tiered zoom), PARA (actionability ordering), Zettelkasten (atomic bullets). Details in [`design-principles.md`](./plugins/structured-notes/skills/structured-notes/references/design-principles.md).

## Extending it

Adding a new input type (e.g. daily standup, sales call, lecture notes) is two edits in `SKILL.md`: a detection signal and a body template. The shared spine, audit, and verification stay the same — that backbone is what keeps every note type feeling like one system.

## Evaluation

The [`evaluation/`](./evaluation) folder contains the actual test suite this skill was validated with — 20 realistic cases across software, sales, healthcare, legal, finance, and education, plus 5 "hidden-gap" cases that need reasoning to catch (a timeline that can't work, a "saving" that's a net loss, a drug interaction). It includes the [test plan](./evaluation/TEST_PLAN.md), the sample inputs, ground-truth keys, and two rendered result reports.

The honest headline: on raw quality the skill **ties** a strong model — Claude is already excellent at this. The measurable wins are self-verification (100% vs 0%), zero invented facts (vs 2 for the baseline), and guaranteed consistency.

## License

[MIT](./LICENSE) — free to use, modify, and redistribute with attribution.

---

*Built with [Claude](https://claude.com).*
