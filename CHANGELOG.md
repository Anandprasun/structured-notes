# Changelog

All notable changes to this skill are documented here. Format loosely follows
[Keep a Changelog](https://keepachangelog.com/); this project uses date-based releases.

## [1.0.0] — 2026-07-18

First public release.

### Added
- **Core skill** — converts meeting scribbles, call/interview transcripts,
  brain-dumps, and reading/lecture notes into glanceable markdown with a
  keyword line, TL;DR, pulled-out decisions and action items, and detail sorted
  by actionability.
- **Input-type router** — auto-detects meeting / transcript / brain-dump /
  generic and adapts the body, over a shared spine.
- **Accountability audit (Step 4a)** — flags ownerless and dateless actions,
  deferred decisions, contradictions, unanswered questions, implied commitments,
  and risks; adds an optional "next best action."
- **Self-verification pass (Step 4b)** — re-checks every number, name, date, and
  quote against the source and reports a fidelity check; marks derived or
  uncertain values instead of asserting them.
- **`references/design-principles.md`** — the research the design draws from.
- **`evaluation/`** — 20-case cross-domain test suite plus 5 hidden-gap
  (reasoning-required) cases, ground-truth keys, and two result reports.
- **`examples/`** — three worked input→output pairs.
- **Claude Code plugin marketplace** — the repo installs directly from GitHub via
  `/plugin marketplace add` + `/plugin install`, no copying required.
- **`portable/`** — a model-agnostic prompt, per-platform install guide, and a
  one-page HTML installer for using the skill on ChatGPT, Gemini, or any API.

### Validated
- Self-verification present and accurate on 100% of runs (vs 0% for plain Claude).
- Zero invented facts across the suite (baseline produced two).
- Fixed an early redundancy issue (decisions restated in two sections) — all
  affected cases returned to full marks with no loss of facts.
