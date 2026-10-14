# Copilot workshop: bare scaffolding

Tag `bare-bare` of the workshop repository: the folder structure Copilot looks in, the guides and templates, and a Git-ignored place for your own input. No use case, no sample data. Use it to build a skill for **your own** task.

The other tags hold the migration example used in the live demo: `demo-0-bare` (example, no context), `demo-1-instructions`, `demo-2-skill`.

## Start

```bash
git clone <repo-url> my-skill
cd my-skill
git switch -c my-work bare-bare
```

Open the folder in VS Code and click **Trust**. In the chat: session target **Local**, mode **Agent**, **Manual permissions**.

Already have a project repository? Work there instead, and copy over `docs/templates/` and the first two lines of `.gitignore`.

## Where things live

| Path | What | Guide |
| --- | --- | --- |
| `.github/copilot-instructions.md` | Team instructions, every request; you create it | [Instructions](.github/instructions/README.md) |
| `.github/instructions/` | Rules for certain file types (`*.instructions.md`) | [Instructions](.github/instructions/README.md) |
| `.github/skills/<name>/SKILL.md` | Team skills, one folder each | [Skills](.github/skills/README.md) |
| `.github/agents/` | Custom agents (`*.agent.md`) | [Custom agents](docs/custom-agents.md) |
| `.github/hooks/` | Enforced rules (`*.json` plus script) | [Hooks](.github/hooks/README.md) |
| `data/input/` | Your real input; ignored by Git | [Input](data/input/README.md) |
| `data/samples/` | Test inputs with a known answer; committed | [Samples](data/samples/README.md) |
| `docs/business-context.md` | Optional: your team's domain, systems, pain points | [Docs](docs/README.md) |
| `docs/templates/` | Instructions, idea card, SKILL.md to copy from | |
| `docs/sql-style-review.md` | No input of your own? A ready-made starter: SQL style review, step by step | [Walkthrough](docs/sql-style-review.md) |
| `~/.copilot/` (your home folder) | Personal instructions, writing style, personal skills; never committed | [Personal examples](personal-examples/README.md) |

Full tree and rules: [STRUCTURE.md](STRUCTURE.md).

## Steps

| Step | Do | Template |
| --- | --- | --- |
| 1 | Put your input file into `data/input/` | [data/input/README.md](data/input/README.md) |
| 2 | Write `.github/copilot-instructions.md`, 5 to 8 lines. `/init` has little to read in an empty repo, so start from the template | [copilot-instructions.md](docs/templates/copilot-instructions.md) |
| 3 | Fill the idea card for one recurring task | [idea-card.md](docs/templates/idea-card.md) |
| 4 | `/create-skill` and paste the idea card | [SKILL.md](docs/templates/SKILL.md) shows the target |
| 5 | Make a test input with a known answer in `data/samples/` | [data/samples/README.md](data/samples/README.md) |
| 6 | Test in a new chat, compare with the expected result, refine | |
| 7 | Commit the skill and the test sample, never the real input | |

## Data rules

- Use only data your company allows you to process with GitHub Copilot. If in doubt, anonymise or use a sample.
- No personal data (names, e-mail addresses, customer numbers that identify people) unless that is explicitly allowed.
- Real input stays in `data/input/`, which Git ignores. Check `git status` before every commit.
- Don't paste rows into the chat. Give Copilot the path; the skill reads the file with code.
- No credentials in files or prompts.
