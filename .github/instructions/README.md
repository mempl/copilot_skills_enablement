# Instructions

Instructions are Markdown files that Copilot adds to requests automatically, so you don't repeat project facts in every prompt. There are two kinds:

| File | Applies | Use for |
| --- | --- | --- |
| `.github/copilot-instructions.md` | Every chat request in this workspace | Project facts every task needs |
| `.github/instructions/*.instructions.md` (this folder) | When the agent creates or edits a file matching `applyTo`, when the `description` matches the task, or when attached manually | Rules for certain file types or tasks, e.g. SQL style |

Instructions are good at stable facts: purpose, folder layout, naming, data conventions, the command that validates a change. They are bad at procedures (use a skill), at anything a linter or formatter already enforces, and at anything personal or secret.

## The project instructions file

**Rules**

1. **One file, always loaded.** `.github/copilot-instructions.md` travels with every chat request. It does not affect inline code completions.
2. **5 to 8 lines.** Every line costs context on every request, in every chat and every subagent.
3. **Project facts only.** Procedures for one kind of task go into a skill.
4. **Give the reason** where a rule isn't obvious; Copilot handles edge cases better when it knows why.

**Create it with `/init`** (Local session) once the repository has real content. `/init` analyses the repository and drafts the file; on an empty repository it produces generic text. Re-running `/init` updates the existing file, so commit first and review the diff. For small changes, edit by hand.

**The delete test:** keep a line only if, without it, Copilot would get something wrong on most tasks in this repository.

```markdown
# Bad: generic, long, mixes in a procedure
- Write clean, maintainable code and follow best practices.
- Use meaningful variable names.
- When checking a file, first load it, then compare the columns, then …
- Our Databricks token is dapi…

# Good: project facts, short
# <Project name>
- Purpose: <one sentence: what this repository is for>.
- Layout: `data/input/` real input (not committed), `data/samples/` test inputs, `docs/` context.
- Naming: snake_case, English names.
- Data: <separator, date format, decimal separator, units>.
- Code: pandas for local checks; no hard-coded paths or credentials.
```

**Verify it:** start a new chat, ask "Where would you put a new test input, and what would you name it?", expand **References** under the answer and check that `copilot-instructions.md` is listed.

## Scoped instructions (this folder)

Files named `*.instructions.md` in this folder (subfolders allowed) apply only where they fit:

```markdown
---
name: 'SQL style'
description: 'Use when writing or changing SQL or dbt models.'
applyTo: '**/*.sql'
---
# SQL style
- Keywords uppercase, identifiers snake_case.
- One CTE per logical step, named after what it returns: `orders_per_customer`, not `cte1`.
- No `SELECT *` in models; list columns explicitly.
```

| Frontmatter | Effect |
| --- | --- |
| `applyTo` | Glob; attached automatically when the agent **creates or edits** a matching file, not when it only reads |
| `description` | Lets the agent load the file when the task matches |
| neither | Only used when attached manually (**Add Context** → Instructions) |

Create one with `/create-instructions` or **Chat: New Instructions File**.

## Personal instructions

Your personal working style and rules (the personal part of your DNA) belong in your home folder, never in this repository:

- **Copilot sessions:** `~/.copilot/copilot-instructions.md`
- **Local sessions:** a user instructions file in your VS Code profile (**Chat: New Instructions File** → User)

See `personal-examples/copilot-instructions.md`.

## Other formats

- **`AGENTS.md`** at the repository root is a cross-agent alternative that Copilot, Codex and others read. Use either it or `copilot-instructions.md`, not both.
- **`CLAUDE.md`** is the Claude harness's format.
- **Organization instructions** are set in GitHub organization settings and add to the repository's own file.

## Gotchas

- **Instructions are additive.** There is no reliable precedence between files; resolve contradictions at the source.
- **Local agent:** the setting `github.copilot.chat.codeGeneration.useInstructionFiles` must be on.
- **Linked files are not guaranteed to load.** Check **References** in the response.
- **Generated drafts can be wrong.** Verify every command, path and convention `/init` writes.
- **Not loaded?** Run **Chat: Open Customizations** to see what was discovered, then **Developer: Open Agent Debug Logs**.
- **No README directly in `.github/`.** It would replace the repository front page.
