# Template: .github/copilot-instructions.md

Copy the block below to `.github/copilot-instructions.md`, fill it, and delete every line that fails the delete test: keep a line only if Copilot would get most tasks in this repo wrong without it. 5 to 8 lines.

```markdown
# <Project name>
- Purpose: <one sentence: what this repo is for>. Context: [docs/business-context.md](../docs/business-context.md).
- Layout: `data/input/` real input (not committed), `data/samples/` test inputs, `docs/` context.
- Data: <formats that matter: separator, date format, decimal separator, units, encoding>.
- Naming: <file, column or table naming rules>.
- Code: <language and libraries for checks, e.g. pandas>; no hard-coded paths or credentials.
- Never invent figures or results; compute them with code and show the code.
- Answer in the language of the question; code and comments in English.
```

Not in this file: procedures for one task (they go into a skill), rules a linter already enforces, generic advice like "write clean code", anything personal (that goes into your personal instructions in `~/.copilot/`).
