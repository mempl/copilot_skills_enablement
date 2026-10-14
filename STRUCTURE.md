# Repository structure

```text
.
├── README.md                         # front page: start, where things live, steps, data rules
├── STRUCTURE.md                      # this file
├── .gitignore                        # data/input/, secrets, generated files
├── .github/                          # everything Copilot loads for the team (no README here)
│   ├── copilot-instructions.md       # team instructions, every request; you create it
│   ├── instructions/                 # *.instructions.md for certain files or tasks
│   │   └── README.md                 # guide: instructions
│   ├── skills/                       # one folder per skill: <name>/SKILL.md
│   │   └── README.md                 # guide: skills, plus index of team skills
│   ├── agents/                       # *.agent.md custom agents; no README (any .md here is an agent)
│   └── hooks/                        # *.json hook definitions plus scripts
│       └── README.md                 # guide: hooks
├── .vscode/
│   └── settings.json                 # data/input/ out of search; edits there and to .env need approval
├── data/
│   ├── input/                        # your real input; ignored by Git
│   │   └── README.md                 # how to get files here (SharePoint, Excel, exports)
│   └── samples/                      # test inputs with a known answer; committed
│       └── README.md                 # how to plant errors and write the expected result
├── docs/
│   ├── README.md                     # what belongs in docs/
│   ├── business-context.md           # optional: team DNA, business part (template)
│   ├── custom-agents.md              # guide: custom agents
│   └── templates/                    # instructions file, idea card, SKILL.md; not loaded from here
└── personal-examples/                # templates for ~/.copilot/; NOT loaded from here
    ├── README.md
    ├── copilot-instructions.md       # personal DNA example
    └── skills/my-writing-style/      # writing style as a personal skill
```

## Rules

- **Copilot only discovers fixed locations.** `.github/copilot-instructions.md`, `.github/instructions/`, `.github/skills/<name>/SKILL.md`, `.github/agents/*.agent.md`, `.github/hooks/*.json`. Files elsewhere are ordinary files.
- **No README directly in `.github/`.** GitHub would show it as the repository front page instead of the root README.
- **No README in `.github/agents/`.** VS Code treats every `.md` file there as a custom agent.
- **No example `*.json` in `.github/hooks/`.** Every JSON file there is an active hook; examples live in the hooks README.
- **Real input never enters the repository.** It stays in `data/input/`.
- **Personal files never enter the repository.** Your DNA, writing style and personal skills live in `~/.copilot/` or your VS Code profile.
