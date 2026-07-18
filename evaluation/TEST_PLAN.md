# Structured-Notes Skill — Test Plan

## Goal
Measure how well the `structured-notes` skill converts raw input into glanceable,
faithful notes — and how much better it does than plain Claude with no skill —
across input types, industries, and deliberate stress cases.

## Method
- 20 realistic messy inputs (see `inputs/`).
- Each input is processed twice: **with-skill** and **baseline** (plain Claude,
  prompt: "Turn this into structured notes").
- Every output is graded blind against the rubric below.
- We report per-case and aggregate scores, plus the with-skill − baseline delta.

## Test matrix (20 cases)

| # | Type | Industry | What it stresses |
|---|------|----------|------------------|
| 01 | Meeting | Software | Sprint planning — decisions + owners |
| 02 | Transcript | Software | User research interview — quotes, themes |
| 03 | Brain-dump | Software | Founder dump — voice + intent split |
| 04 | Meeting | Software | Standup — **info-only, few/no decisions** (omit-empty) |
| 05 | Reading/generic | Software | Engineering RFC reading notes |
| 06 | Transcript | Sales | Discovery call — pain/quotes/pricing |
| 07 | Meeting | Sales | Pipeline/deal review — numbers + next steps |
| 08 | Transcript | Sales | Churn / cancellation call — sentiment |
| 09 | Brain-dump | Sales | AE pre-QBR dump |
| 10 | Meeting | Sales | Sales kickoff — **long, many topics** |
| 11 | Meeting | Healthcare | Care-team huddle — **clinical term fidelity** |
| 12 | Transcript | Legal | Client intake call — facts, dates |
| 13 | Meeting | Finance | Budget review — **numbers fidelity** |
| 14 | Transcript | Legal | Witness prep snippet — **verbatim quotes** |
| 15 | Brain-dump | Healthcare | Clinician dump — jargon + tasks |
| 16 | Reading/generic | Education | Lecture notes — concept hierarchy |
| 17 | Reading/generic | Research | Paper reading notes — claims + evidence |
| 18 | Brain-dump | Education | Grad-student scattered dump |
| 19 | Meeting | Education | Faculty/committee meeting |
| 20 | Ambiguous | General | **Type ambiguous** (meeting vs transcript) — router test |

## Rubric (score each 0–2; 0 = fails, 1 = partial, 2 = strong)

1. **Type detection** — right template chosen for the content. (Skill-specific;
   for baseline, scored on whether the implied structure fits the content.)
2. **Glanceability** — TL;DR (and keyword line) genuinely convey the gist in
   seconds; most important content is near the top.
3. **Structure** — appropriate, labelled sections; sorted by actionability, not
   raw chronology.
4. **Action items** — concrete task · owner · due; vague items demoted, not
   invented.
5. **Decisions** — decisions surfaced in their own place (or correctly omitted
   when there are none — no fabricated section).
6. **Fidelity** — no invented facts; names, numbers, dates, dosages, quotes
   preserved exactly.
7. **Conciseness** — filler dropped, one idea per line, no bloat or restated
   source.
8. **Voice / appropriateness** — brain-dumps keep the author's voice; high-stakes
   domains keep precise terminology.

Max score per output = 16. We report the mean across cases for each configuration
and the delta.

## What "better" looks like
The skill should win most on: glanceability (keyword line + TL;DR), decision
separation, action-item discipline, omit-empty behaviour, and consistency across
cases. The baseline often produces *reasonable* notes but with higher variance —
burying decisions, skipping owners/dates, occasionally padding or inventing, and
no consistent glance layer.
