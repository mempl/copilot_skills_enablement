# Docs

Documentation for people, and context Copilot reads only when it is attached or linked.

| File | What | How Copilot uses it |
| --- | --- | --- |
| `business-context.md` | Team DNA, business part: domain, stakeholders, systems, constraints, deliverables | Linked from `.github/copilot-instructions.md`; attach with `#file:docs/business-context.md` for planning or stakeholder texts |
| `custom-agents.md` | Guide to custom agents | Reference for people |
| `templates/` | Instructions file, idea card (blank and a filled SQL example), SKILL.md | Copy from here; Copilot does not load them in this folder |
| `sql-style-rules.md` | Rules for the `sql-style-review` starter idea | Copy into the skill's `references/` when you build it |

**Why the business context is not in the instructions file:** the instructions file travels with every request and stays at 5 to 8 lines. Only the one or two business lines every task needs go there; the full context stays here and is loaded when a task needs it.

**Not here:** the personal part of your DNA (role, working style, personal rules) and your writing style. Those live in `~/.copilot/` on your own machine. See `personal-examples/`.
