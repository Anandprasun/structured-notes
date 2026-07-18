---
name: structured-notes
description: >-
  Turn raw, messy written input into clean, structured, glanceable notes. Use
  whenever someone pastes unstructured meeting scribbles, a call or interview
  transcript, a personal brain-dump, or lecture/reading notes and wants it
  "cleaned up", "organized", "turned into notes", "summarized", or "structured"
  — including when they don't say "notes" ("make sense of this", "tidy this up",
  "what were the action items here"). Produces glanceable markdown: keyword line
  and TL;DR on top, decisions and actions pulled out, detail below. Goes beyond
  reformatting — it runs an accountability AUDIT (flagging ownerless/dateless
  actions, deferred decisions, contradictions, unanswered questions, implied
  commitments) and a self-VERIFICATION pass (re-checking every number, name,
  date, and quote against the source). Do NOT use for polished prose
  deliverables (reports, essays, blog posts) — that is writing, not formatting.
---

# Structured Notes

Convert raw input (meeting scribbles, call/interview transcripts, brain-dumps,
reading/lecture notes) into notes that a reader can understand **in 3 seconds,
30 seconds, or 3 minutes** depending on how deep they need to go.

Output is **markdown text, returned in the reply** for the person to copy
wherever they keep notes — unless they ask for a file, in which case save a
`.md` and deliver it.

**What makes these notes different from just asking an AI to "tidy this up":** a
strong model already reformats text well, so clean sections alone are not the
value. The value is the two things a model does *not* do unless told to, in
Step 4 — it **audits** the content for what's missing or inconsistent (the stuff
that quietly bites you later), and it **verifies** its own output against the
source. Formatting is table stakes; the audit and the verification are the point.

The output is **layered**: the readable notes come first (unchanged glance
experience), then a short `— — —` divider, then the **Gaps & Risks** audit, then
a one-line **Fidelity check**. A reader who only wants the notes stops at the
divider; a reader who has to *act* on them reads the audit.

## The one principle behind everything

Sort by **actionability and importance, not by chronology**. The most reusable,
most-forgotten artifacts of any input — decisions and commitments — go near the
top where they can't get lost. Raw detail sinks to the bottom. A note fails the
moment its reader has to hunt for what matters.

## Step 1 — Detect the input type

Read the input and pick the closest template. The signals:

- **Transcript** — speaker labels (`Alex:`), timestamps (`[00:14]`), or spoken
  back-and-forth. Optimize for retrieval and evidence, not completeness.
- **Meeting** — several named people, agenda/decision language, but no
  turn-by-turn speech.
- **Brain-dump** — first-person, freeform, one author, tasks/ideas/feelings
  mixed together.
- **Generic** — none of the above (reading notes, lecture notes, a rough list).
  Use the universal spine and adapt sensibly.

If it's genuinely ambiguous, state your best guess in one line
("Treating this as a brain-dump — tell me if it's a meeting") and proceed. Since
the person is reading the output right there, they can redirect you cheaply.
Never block on a question you can reasonably answer yourself.

## Step 2 — The universal spine

Every note, whatever the type, is built from this backbone. **Omit any section
that would be empty — never fabricate content to fill it.** An empty "Decisions"
heading is worse than no heading.

1. **Header line** — `# <title>` on its own line, then a metadata line:
   `<date> · <participants / source>`. Infer a short descriptive title from the
   content. If a field is unknown, write a `<add date>`-style placeholder rather
   than dropping the whole line — a consistent header is part of what makes a
   stack of notes scannable.
2. **Keywords** — a single line of 4–8 topic terms separated by ` · `. This is a
   fingerprint: it tells the reader what the note is about before they read a
   word. (Borrowed from Fireflies.)
3. **TL;DR** — 2–4 bullets (or 2–3 sentences) capturing the whole thing. This is
   *the* glance layer. If someone reads only this, they should get ~80%.
4. **Body** — the type-specific part (Step 3).
5. **Decisions** — what was actually decided, each with a one-line why. Its own
   section, never merged into the summary, because decisions are the thing
   people come back to look up.
6. **Action items** — a table. Every row is `task · owner · due`. See the rule
   below.
7. **Open questions / follow-ups** — unresolved threads.

### The action-item rule

Vague actions are the number-one failure mode of notes. An action item earns its
place only if it is specific enough to act on:

```
| Task | Owner | Due |
|------|-------|-----|
| Send the revised contract to Legal | Priya | Fri Jul 24 |
```

If the owner or due date genuinely wasn't stated, write `—` rather than
inventing one, but keep the task concrete. If something is too vague to be a real
task ("follow up on the thing"), demote it to Open Questions instead of
polluting the action list.

## Step 3 — Type-specific body

### Meeting
Group the body by topic. Under each topic, lead with a **one-line gist**, then
atomic bullets.

```
## Discussion
### <Topic> — <one-line gist of where it landed>
- <one point per line, **key phrase bolded**>
- ...
```

### Call / interview transcript
Cluster by theme, not by chronology. Preserve the speaker's own words where the
exact wording carries weight, and keep a timestamp so any claim is verifiable.

```
## Key themes
### <Theme> — <one-line gist>
- <finding, **key phrase bolded**>
- > "verbatim quote worth keeping" — <Speaker> [~12:30]

## Notable quotes        (only if there are quotes worth preserving)
```
For interviews being compared across several people, switch to a table (one row
per person, columns = the shared questions) — a chart beats prose whenever the
data is parallel.

### Brain-dump
The job is to impose **light** structure without sanding off the person's voice.
Over-cleaning a brain-dump into corporate prose destroys the half-formed ideas
that were the point. Split by *intent*, not topic, and infer the buckets
yourself:

```
## In one line: <what this is really about>

## Do            (checkbox tasks — task, and due/priority if stated)
## Ideas         (clustered loosely; **bold** the promising ones)
## Decisions     (anything already concluded)
## Open loops    (questions, things to figure out)
## Loose ends    (anything that didn't fit — never drop it just to be tidy)
```

For a brain-dump, the **`Do` section replaces the spine's Action-items table** —
don't render both, or the same tasks appear twice. (Owner is almost always the
author, so a table adds nothing here.) Keep the table for meetings and
transcripts, where owner and due date carry real information.

## Fidelity rules (why the notes stay trustworthy)

A note is only useful if the reader can trust it without re-reading the source.

- **Never invent.** No decision, name, number, date, or action that wasn't in the
  input. If the input implies but doesn't state something, mark it
  ("sounds like X, unconfirmed") rather than asserting it.
- **Preserve verbatim** the things that must stay exact: names, numbers, dates,
  direct quotes, and commitments. Distillation drops filler, not facts.
- **One idea per line.** Never pack multiple facts into one run-on bullet — it
  kills scannability and can't be quoted or checked off.
- **Bold the load-bearing phrase** in a bullet so the note can be read at
  summary-depth or full-depth (tiered zoom).
- **Omit empty sections.** A template is a menu, not a checklist.
- **Say each thing once.** Decisions and action items are *pulled out* of the
  discussion into their own sections — so the Discussion/body should give the
  context and reasoning that led somewhere, not restate the decision that's
  already in the Decisions section. A one-line topic gist can say where things
  landed; it should not duplicate the full decision text verbatim. Likewise, add
  a quote only when it carries something the surrounding bullet doesn't, and
  don't list an "open question" that just echoes a point already made. Redundancy
  is the most common way these notes turn from tight to bloated.

## Step 4 — The intelligence layers (this is the actual value)

After the notes are drafted, do two passes the notes themselves don't contain.
These are what separate this skill from a plain "summarize my notes" — a model
won't do them unprompted, and they are where the reader actually gets saved.

### 4a. The accountability audit — "Gaps & Risks"

Re-read the source *as a skeptic whose job is to find what will bite the reader
next week.* You are not summarizing anymore; you are auditing. Scan for every one
of these, and surface the ones that are really present:

- **Ownerless actions** — something clearly needs doing but nobody is on the
  hook. ("Update the customer changelog" — no owner named.)
- **Dateless commitments that block others** — an action with no due date that
  other work depends on. ("Lock the design system" gates eng, but has no date.)
- **Deferred / re-deferred decisions** — a decision punted to "later." Flag it,
  and if the source shows it's been punted before, say so — repeat deferral is a
  red flag.
- **Contradictions & inconsistencies** — two statements that can't both be true,
  or numbers that don't reconcile. ("$40k is this quarter" vs "it rolls over.")
- **Unanswered questions** — a question was raised and nobody resolved it.
- **Vague or unverifiable commitments** — "we'll circle back," "someone should
  look into it" — real enough to flag, too soft to be an action.
- **Implied but unstated actions** — a commitment the author made in passing that
  never made it onto anyone's list. ("I'll nudge him" is a real action; so is
  "we should get a second quote.") Surfacing these is high-value: they're the
  tasks that vanish precisely because nobody wrote them down.
- **Risks / blockers** — anything that threatens the goal (a departed champion, a
  slipping timeline, a single point of failure).

Format each as a one-line flag with a marker and, where useful, the fix:

```
— — —

## ⚠ Gaps & Risks
- **No owner:** "update the customer changelog" — nobody took it.
- **No date:** "lock the design system" blocks eng but has no deadline.
- **Contradiction:** is the $40k this quarter or rolling over? Stated both ways.
- **Deferred:** legal review of checkout copy — raised, nobody decided.
- **Implied action:** you said you'd "nudge Ravi" — not on anyone's list.

**▶ Next best action:** Priya's crash hotfix (P0, shipping today) — everything
else can wait a day.
```

Rules that keep this trustworthy rather than noisy:
- **Only flag what's genuinely there.** Do not manufacture gaps to fill the
  section — a fabricated risk is as bad as a fabricated fact. If the input is
  genuinely clean (rare for real notes), write `## ✓ No gaps found` and move on.
- **Each flag must be checkable against the source** — point at the thing, don't
  editorialize.
- The **Next best action** is optional; include it only when one step clearly
  matters most. It's the "if you do one thing" line.

### 4b. The self-verification pass — "Fidelity check"

Now re-read the source one more time, this time checking your *own* output. Go
through every number, name, date, dosage, dollar figure, and quoted phrase in the
notes and confirm each appears in the source unchanged. This directly prevents the
most common and most damaging failure: a small, plausible, invented detail.

End the output with a compact check line:

```
## ✓ Fidelity check
14/14 key facts verified against source. No invented figures.
```

When something doesn't cleanly verify, say so explicitly instead of hiding it:
- **Derived numbers:** if you computed a total the source didn't state (e.g.
  summing two costs), never present it as stated — either drop it or mark it
  `(derived: $4,200 + $6,000)`.
- **Placeholders:** if you used `<add date>` or `—` for a missing field, the
  check line notes it: `2 fields left blank (no owner / no date stated)`.
- **Uncertain readings:** if the source was ambiguous ("the 20th" with no month),
  keep it verbatim and flag it: `"the 20th" — no month given, left as-is`.

The check line is short by design. Its job is to tell the reader "you can trust
the numbers above," and to make *you* actually do the pass rather than assume.

## Extending to new input types

This skill is built to grow. To add a type (e.g. lecture notes, sales calls,
daily standup), add (a) a detection signal to Step 1 and (b) a body template to
Step 3. The spine and fidelity rules stay the same — that shared backbone is what
keeps every note type feeling like one system. See
`references/design-principles.md` for the research these templates are drawn from
and the deeper rationale behind each choice.
