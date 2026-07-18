# Design principles — research behind the structured-notes skill

This file records *why* the skill is shaped the way it is, drawn from a review of
best-in-class note-taking apps and established note methodologies. Read it when
extending the skill or deciding how to structure a new input type.

## Where the structure comes from

The skill's structure is a synthesis of what the best note tools and methods
actually do. The single highest-leverage pattern across all of them:

> **headline + gist + progressive detail, sorted by actionability, with a
> keyword line and TL;DR on top** — so the note is readable in 3 seconds, 30
> seconds, or 3 minutes depending on how much the reader needs.

## The ten transferable principles (ranked)

1. **Lead with a one-line TL;DR.** Readers decide in ~3 seconds whether to read
   on. (Progressive Summarization; Notion, Fathom)
2. **Keyword/topic fingerprint line at the very top.** 4–8 scannable terms tell
   you the subject before you read a word. (Fireflies)
3. **Cluster by topic; give each cluster a one-line gist headline.** Turns a wall
   into skimmable headline+detail pairs. (tl;dv Smart Topics; mind-mapping)
4. **Action items: task + single owner + deadline, or omit.** Vague actions are
   the #1 failure mode. (Granola; Evernote Tasks)
5. **Decisions get their own section.** Highest-value, most-forgotten artifact;
   never bury them in a paragraph. (Granola; Fathom)
6. **One idea per line — atomic units.** Cheapest separation; makes anything
   quotable and checkable. (Zettelkasten atomicity; Sentence method)
7. **Tiered zoom via bolded key phrases.** Read at summary-depth or full-depth.
   (Progressive Summarization)
8. **Typed, semantic section labels** (Summary, Decisions, Actions, Questions).
   Scannable and consistent. (Obsidian callouts; Cornell zones)
9. **Sort by actionability, not chronology.** Live/actionable first; raw
   transcript last. (PARA; and why every meeting app buries the transcript)
10. **Keep source traceability.** Link claims to their origin — timestamp,
    speaker, quote — so the summary is trustworthy without re-reading.
    (Fathom, Fireflies citations)

## What the meeting/transcript apps auto-generate (consensus)

Near-universal core: **Summary → Action Items → Decisions/Next Steps →
Transcript.** Differentiators worth borrowing: Keywords/Topics line (Fireflies,
tl;dv), Metadata block (Granola), timestamp citations (Fathom, Fireflies, tl;dv),
and meeting-type presets that swap the section set (Notion, Granola, Otter,
Fathom).

## What the methodologies contribute

- **Cornell** — separate content from retrieval handles (cue keywords + a
  bottom summary).
- **Zettelkasten** — atomicity: one self-contained idea per unit.
- **PARA** — sort by actionability, not topic.
- **Bullet Journal** — a tiny fixed glyph set encoding type + status in one
  leading character (useful if adding a rapid-log input type).
- **Outline / mind-map / charting** — indentation = hierarchy; radial grouping
  around a hub; force columns for parallel/comparable data.
- **Progressive Summarization** — layered emphasis = tiered zoom; compress
  just-in-time, not all upfront.

## Anti-patterns to avoid (what the best tools don't do)

- Opening with a wall of text (no TL;DR).
- Vague action items with no owner/date.
- Merging decisions into the summary.
- Dumping the raw transcript at the top.
- Packing multiple ideas per bullet.
- Over-cleaning brain-dumps into corporate prose (loses the person's voice and
  half-formed ideas).
- Inventing structure that isn't there — fabricating an empty Decisions section
  with filler. Omit empty sections instead.
- Using a single fixed template for every input type — offer presets; let empty
  sections disappear.
- Heavy visual formatting. The methods win with *cheap* signals: indentation, a
  leading glyph, a bold phrase, a short label.

## Ideas parked for future extension

- **Meeting-type presets** (standup / 1:1 / sales / interview) that add or remove
  sections from the meeting template.
- **BuJo glyph vocabulary** (`•` task, `~` idea, `?` question, `–` note, `*`
  priority) for a dedicated rapid-log / daily-log input type.
- **Comparison tables** for multi-interview or multi-source synthesis.
