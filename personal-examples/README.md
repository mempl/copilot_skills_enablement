# Personal examples

Templates for what belongs in **your own** Copilot folder. Copilot does **not** load these files from this repository: they are outside the discovered locations on purpose. Copy them to your home folder, fill them in, and never commit your filled versions.

| File | Copy to | What it is |
| --- | --- | --- |
| `copilot-instructions.md` | Copilot sessions: `~/.copilot/copilot-instructions.md`. Local sessions: **Chat: New Instructions File** → User, paste the content | Personal part of your DNA: role, working style, personal rules |
| `skills/my-writing-style/` | `~/.copilot/skills/my-writing-style/` | Your writing style as a personal skill |

## Install the writing skill

macOS / Linux:

```bash
mkdir -p ~/.copilot/skills
cp -r personal-examples/skills/my-writing-style ~/.copilot/skills/
```

Windows (PowerShell):

```powershell
New-Item -ItemType Directory -Force "$HOME\.copilot\skills" | Out-Null
Copy-Item -Recurse personal-examples\skills\my-writing-style "$HOME\.copilot\skills\"
```

Then type `/skills` in a new chat; `my-writing-style` should appear under personal skills.

## Why a skill and not instructions

The style guide is a procedure with templates, examples and a check. As always-on instructions it would colour code answers and comments too, and its templates would cost context on every request. As a skill it loads only when you draft a message.

## How the DNA splits

| DNA part | Goes to |
| --- | --- |
| Identity, working style, personal hard rules | Personal instructions (this folder's `copilot-instructions.md`) |
| Domain, stakeholders, systems, constraints | `docs/business-context.md` (shared) |
| Pain points, standard deliverables | Skill ideas |
| Writing style | Personal skill `my-writing-style` |
