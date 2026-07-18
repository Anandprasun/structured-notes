# Install / use on any AI system

The same skill works two ways: as a **native Claude skill** (auto-triggers, one
install) or as a **portable prompt** you paste into any assistant. Pick your
platform below. The portable prompt lives in [`PROMPT.md`](./PROMPT.md).

There's also an interactive one-page installer with copy buttons:
open [`install.html`](./install.html) in a browser.

---

## Claude (native skill — best experience)

The skill auto-detects when you're pasting notes and triggers itself.

- **Claude Code (install from GitHub — recommended):**
  ```
  /plugin marketplace add <your-username>/structured-notes
  /plugin install structured-notes@prasun-skills
  ```
- **Claude app / Cowork:** add [`dist/structured-notes.skill`](../dist/structured-notes.skill) via your skills settings.
- **Manual copy:** `cp -r plugins/structured-notes/skills/structured-notes ~/.claude/skills/`

Then just paste your notes — no need to name the skill.

## Claude (portable prompt, no skill install)

Paste the contents of [`PROMPT.md`](./PROMPT.md) as your **system prompt** (in the
API) or as the first message in a Project's custom instructions, then send your
raw notes.

## ChatGPT — Custom GPT (reusable)

1. ChatGPT → **Explore GPTs → Create** (or **My GPTs → Create a GPT**).
2. Open the **Configure** tab.
3. Paste the contents of [`PROMPT.md`](./PROMPT.md) into the **Instructions** box.
4. Name it "Structured Notes", save (Only me is fine).
5. Open it and paste any messy notes.

**One-off (no Custom GPT):** paste `PROMPT.md` as your first message, then paste
your notes as the second message.

## Google Gemini — Gem (reusable)

1. Gemini → **Gems → New Gem** (Gem manager).
2. Paste the contents of [`PROMPT.md`](./PROMPT.md) into the **Instructions**.
3. Name it "Structured Notes", save.
4. Chat with the Gem and paste your notes.

**One-off:** paste `PROMPT.md`, then your notes, in a normal Gemini chat.

## Any API (Claude, OpenAI, or Gemini)

Use `PROMPT.md` as the **system prompt** and the raw notes as the user message.

<details>
<summary>Claude (Anthropic SDK)</summary>

```python
import anthropic
client = anthropic.Anthropic()
SYSTEM = open("portable/PROMPT.md").read()   # or paste the prompt text directly

msg = client.messages.create(
    model="claude-sonnet-4-5",
    max_tokens=2000,
    system=SYSTEM,
    messages=[{"role": "user", "content": raw_notes}],
)
print(msg.content[0].text)
```
</details>

<details>
<summary>OpenAI SDK</summary>

```python
from openai import OpenAI
client = OpenAI()
SYSTEM = open("portable/PROMPT.md").read()

resp = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": SYSTEM},
        {"role": "user", "content": raw_notes},
    ],
)
print(resp.choices[0].message.content)
```
</details>

<details>
<summary>Google Gemini SDK</summary>

```python
import google.generativeai as genai
genai.configure(api_key="...")
SYSTEM = open("portable/PROMPT.md").read()

model = genai.GenerativeModel("gemini-1.5-pro", system_instruction=SYSTEM)
print(model.generate_content(raw_notes).text)
```
</details>

---

### Which should I use?

- Want it to **just work automatically** on Claude, with the audit and
  verification tuned and tested → use the **native skill**.
- Want it on **ChatGPT / Gemini / your own app** → use the **portable prompt**.

The instructions are identical; only the packaging differs. Model quality varies,
so outputs won't be byte-identical across platforms — but the structure, audit,
and verification behavior carry over.
