# Sales migration: working with GitHub Copilot

Workshop repository for **Effizient arbeiten mit Copilot** (groups 2 and 4). It shows how much the quality of Copilot's output depends on the context you give it, and where each kind of context lives in a repository.

All data in this repository is fictitious: no real customers, stores or figures.

## States (Git tags)

| Tag | Content | Use it to |
| --- | --- | --- |
| `demo-0-bare` | Migration example without instructions or skill | Write your instructions file on the example |
| `demo-1-instructions` | + `.github/copilot-instructions.md` | |
| `demo-2-skill` | + the `migration-reconciliation` skill | See the finished example |
| `starter` | Bare bones: no use case, templates, a Git-ignored `data/input/` | Build a skill on **your own** data |

```bash
git switch -c my-work starter        # or demo-0-bare
```

`git tag` only lists the tags; `git switch -c <branch> <tag>` starts your own branch from one.

## Quick start

1. Open this folder in VS Code and trust it when asked. In Restricted Mode, agents are disabled.
2. Sign in: hover over the Copilot icon in the Status Bar, select **Use AI Features** and sign in with your work GitHub account.
3. Open the chat with Ctrl+Alt+I (macOS ⌃⌘I). For more space, run **Chat: New Chat Editor**.
4. In the chat input, choose session target **Local**, mode **Agent** and **Manual permissions**.
5. Type `/` to see commands and skills; `/skills` lists the skills Copilot found.

## Three layers of context

Copilot knows nothing about this project except what lands in its context window for the current request. The three layers differ in when they load, how big they are and who maintains them.

| | Prompt | Instructions | Skill |
| --- | --- | --- | --- |
| What | What you type now, plus attached files | `.github/copilot-instructions.md` | A folder `.github/skills/<name>/` with `SKILL.md` |
| Loaded | This request only | Every chat request in the workspace | Name and description always; body when the task matches or you type `/name`; supporting files only when linked |
| Holds | Today's task: which file, which month | Stable project facts: purpose, layout, naming, data conventions | A recurring procedure: steps, rules, mappings, templates, output format |
| Size | As needed | 5 to 8 lines | Up to a few hundred lines; detail in linked files |
| Missing, Copilot will… | guess the task | guess folders, naming, formats | guess the procedure |

**Where does a sentence go?**

1. True for every task in this repository: **instructions**.
2. Needed for one kind of recurring task and writable as steps: **skill**.
3. Only about today's task: **prompt**.
4. Already enforced by a linter, formatter or test: **nowhere**.
5. Must never be broken, whatever the model thinks: **hook**.

## Where things live

| Path | What | Guide |
| --- | --- | --- |
| `.github/copilot-instructions.md` | Team instructions, loaded on every request | [Instructions](.github/instructions/README.md) |
| `.github/instructions/` | Rules for certain file types or tasks (`*.instructions.md`) | [Instructions](.github/instructions/README.md) |
| `.github/skills/` | Team skills, one folder each | [Skills](.github/skills/README.md) |
| `.github/agents/` | Custom agents (`*.agent.md`) | [Custom agents](docs/custom-agents.md) |
| `.github/hooks/` | Enforced rules (`*.json` plus script) | [Hooks](.github/hooks/README.md) |
| `docs/business-context.md` | Team DNA, business part | [Docs](docs/README.md) |
| `~/.copilot/` (your home folder) | Personal instructions, writing style, personal skills; never committed | [Personal examples](personal-examples/README.md) |

The full tree is in [STRUCTURE.md](STRUCTURE.md).

## Modes

| Mode | Changes files | Use it for |
| --- | --- | --- |
| **Ask** | No | Questions about code and concepts |
| **Agent** | Yes, with your approvals | Building; default in this workshop |
| **Plan** (`/plan`) | No, until you approve the plan | Changes across several files, unclear approach |
| **Autopilot** | Yes, without asking | Not here; only in a sandbox or cloud session |

## Commands you need

| Command | What it does |
| --- | --- |
| `/init` | Drafts or updates `.github/copilot-instructions.md` from the repository; cut the draft to 5 to 8 lines |
| `/create-skill` | Generates a skill folder with `SKILL.md` from a description |
| `/skills` | Lists the skills Copilot found |
| `/<skill-name> <input>` | Runs a skill directly |
| `/plan <task>` | Researches read-only and proposes a plan |
| `/clear` | New chat; use it for every new task and every test run |
| `/compact` | Summarises a long chat |
| `#file:<path>` | Attaches a file as context |

`/init` and the `/create-*` commands need a **Local** session.

## Ground rules

- **Manual permissions.** No **Allow all**, no **Autopilot**, no `/yolo`.
- **One task, one chat.** Start a new chat for every task and every test run.
- **Fictitious data only.** No secrets, no personal data, in files or prompts.
- **Review every diff** before you keep an edit.
- **Changes to `.github/`** go through a pull request with review.
- **Check AI output against a known result.** Count what it found, what it missed and what it invented.
