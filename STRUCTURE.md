# Repository structure

```text
.
├── README.md                         # front page: quick start, three layers, ground rules
├── STRUCTURE.md                      # this file
├── .gitignore                        # dbt output, logs, secrets, large data
├── .github/                          # everything Copilot loads for the team (no README here)
│   ├── copilot-instructions.md       # team instructions, every request; created with /init
│   ├── instructions/                 # *.instructions.md for certain files or tasks
│   │   └── README.md                 # guide: instructions
│   ├── skills/                       # one folder per skill: <name>/SKILL.md
│   │   └── README.md                 # guide: skills, plus index of team skills
│   ├── agents/                       # *.agent.md custom agents; no README (any .md here is an agent)
│   └── hooks/                        # *.json hook definitions plus scripts
│       └── README.md                 # guide: hooks
├── .vscode/
│   └── settings.json                 # search exclusions, approval for sensitive files
├── docs/
│   ├── README.md                     # what belongs in docs/
│   ├── business-context.md           # team DNA, business part
│   └── custom-agents.md              # guide: custom agents
├── data/
│   ├── README.md                     # rules: fictitious only, size limit, naming
│   └── samples/
│       ├── legacy-dwh/               # extracts from the legacy DWH
│       └── databricks/               # the same reports from the new platform
├── dbt/
│   └── README.md                     # dbt project root
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
- **Personal files never enter the repository.** Your DNA, writing style and personal skills live in `~/.copilot/` or your VS Code profile.

## Personal locations (outside the repository)

| What | Copilot sessions | Local sessions |
| --- | --- | --- |
| Personal instructions (DNA, personal part) | `~/.copilot/copilot-instructions.md` | User instructions file in the VS Code profile (**Chat: New Instructions File** → User) |
| Personal skills (e.g. writing style) | `~/.copilot/skills/<name>/` | `~/.copilot/skills/<name>/` |
| Personal custom agents | `~/.copilot/agents/` | VS Code profile |
| Personal hooks | `~/.copilot/hooks/*.json` | `~/.copilot/hooks/*.json` |
