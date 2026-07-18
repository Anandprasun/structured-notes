# Contributing to structured-notes

Thanks for your interest in improving this skill. It's deliberately small and
readable — the whole thing lives in `plugins/structured-notes/skills/structured-notes/SKILL.md` — so
contributions are easy to make and review.

## Ways to contribute

- **Add a new input type** (e.g. daily standup, sales call, lecture notes,
  1:1 notes). This is the most common contribution — see below.
- **Improve the audit or verification passes** — new gap categories worth
  flagging, or clearer verification rules.
- **Add test cases** — especially adversarial ones the skill currently mishandles.
- **Fix bugs / tighten wording** in `SKILL.md`.

## Adding a new input type

The skill is built to grow. A new type is two edits in `plugins/structured-notes/skills/structured-notes/SKILL.md`:

1. **A detection signal** in *Step 1 — Detect the input type* (how to recognise it).
2. **A body template** in *Step 3 — Type-specific body* (how to lay it out).

The shared spine, the accountability audit (Step 4a), and the self-verification
pass (Step 4b) stay the same — that backbone is what keeps every note type
feeling like one system. Don't fork them per type.

## Testing your change

The `evaluation/` folder has the suite this skill was validated with. To sanity-check a change:

1. Take a few inputs from `evaluation/sample-inputs/` (and/or write your own).
2. Run them through Claude with your edited skill and eyeball the output against
   the rubric in [`evaluation/TEST_PLAN.md`](./evaluation/TEST_PLAN.md).
3. For gap/audit changes, check recall against the ground-truth keys
   (`evaluation/gaps_ground_truth.json`, `evaluation/gaps_hidden_ground_truth.json`).

A change should not regress **fidelity** (no invented facts) or **conciseness**
(no restating the same content twice) — those were the two hardest-won properties.

## Guiding principles (please keep these)

- **Explain the *why*.** The skill talks to a capable model; reasons persuade
  better than rigid `ALWAYS`/`NEVER` rules. Prefer explanation over decree.
- **Never invent.** Every fact in a note must trace to the source.
- **Say each thing once.** Decisions/actions live in their own sections; the body
  gives context, not a restatement.
- **Omit empty sections.** A template is a menu, not a checklist.

## Submitting

Open a pull request with a short description of the change and, if it affects
output, a before/after example. For larger changes, open an issue first to
discuss the direction.
