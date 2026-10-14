# Custom agents

A custom agent is a role: instructions, a fixed tool list, an optional model and optional handoffs to other agents, stored as `.github/agents/<name>.agent.md`. It appears in the agent picker next to **Agent**, **Ask** and **Plan**, and other agents can call it as a subagent.

This guide lives in `docs/` because VS Code treats **every** `.md` file in `.github/agents/` as a custom agent, including a README.

## When to use a custom agent

| Good fit | Example |
| --- | --- |
| A role that must not do certain things | Read-only reviewer without edit or terminal tools |
| A fixed model for a task | A stable, well-specified skill on a cheaper model |
| A staged workflow | Plan → implement → review, with handoff buttons |
| Coordinating subagents | Research subagent and implementation subagent |

| Custom agent vs skill | Skill | Custom agent |
| --- | --- | --- |
| Describes | A procedure | A role |
| Loaded | Automatically when relevant, or `/name` | Selected in the picker, or called as subagent |
| Restricts tools | No | Yes, `tools` |
| Chooses the model | No | Yes, `model` |

They combine well: the agent says *who* does the work and with which tools and model; the skill says *how*.

## Frontmatter

| Field | Meaning |
| --- | --- |
| `name` | Name in the picker; defaults to the file name |
| `description` | Shown as placeholder text in the chat input |
| `argument-hint` | Hint shown in the chat input |
| `tools` | Tools and tool sets the agent may use; `<server>/*` for all tools of an MCP server |
| `model` | One model name, or a list tried in order until one is available |
| `agents` | Agents it may call as subagents; needs the `agent` tool in `tools` |
| `user-invocable` | `false` hides it from the picker; still usable as subagent |
| `disable-model-invocation` | `true` prevents other agents from calling it |
| `handoffs` | Buttons after a response: `label`, `agent`, `prompt`, `send`, `model` |
| `hooks` | Hooks that run only while this agent is active (Local harness, preview) |

## Example: read-only style reviewer on a cheaper model

```markdown
---
name: Style Reviewer
description: Reviews SQL and notebooks against team conventions. Reports only.
tools: ['search/codebase', 'search/usages']
model: ['<low-cost model>', '<fallback model>']
handoffs:
  - label: Fix the findings
    agent: agent
    prompt: Fix the findings listed above, one commit per rule.
    send: false
---
Use the sql-style-review skill for every review.
Do not edit files. If a finding is unclear, say so instead of guessing.
```

Check exact tool names with **Configure Tools** in the chat input and model names in the model picker.

## Create and manage

| Step | How |
| --- | --- |
| Generate | `/create-agent` (Local session), or the **Overview** page of **Chat: Open Customizations** (Copilot session) |
| Create by hand | **Chat: New Custom Agent**, or a file in `.github/agents/` |
| Find the source of an agent | **Configure Custom Agents** in the agent picker, hover over the agent |
| Personal agents | `~/.copilot/agents/` |

## Gotchas

- **Any `.md` file in `.github/agents/` is an agent.** No README, no notes there.
- **Unavailable tools are ignored silently.** A typo in `tools` leaves the agent without that tool.
- **Subagents make their own model requests.** The main chat stays smaller, but total cost does not necessarily drop.
- **A cheaper model is not automatically cheaper.** Retries and rework can cost more; compare credits and result quality on the same input.
- **Old `.chatmode.md` files** are the former name; rename them to `.agent.md`.
- **Least privilege.** Give each agent only the tools its role needs; shared agents are reviewed like code.
