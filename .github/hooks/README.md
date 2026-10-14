# Hooks

A hook is a command that runs automatically at a fixed point in the agent's work, for example before every tool call. Instructions and skills are text the model *should* follow; a hook is code that *always* runs, whatever the model decides. **Instructions ask, hooks enforce.**

Every `*.json` file in this folder is an active hook. Keep examples in this README, not as files here.

## When to use a hook

| Good fit | Example |
| --- | --- |
| A rule that must never be broken | Block `DROP TABLE` or the production Databricks profile |
| An action that must always happen | Run the SQL formatter after every file edit |
| An audit trail | Log every tool call with timestamp |
| Context the agent always needs | "Target environment is dev" at session start |

Not a fit: guidance, conventions and procedures. Those belong in instructions and skills.

## How it works

1. A JSON file defines which event runs which command.
2. When the event fires, the command receives the details as JSON on standard input, e.g. tool name and tool input.
3. The command can answer on standard output: allow, deny or ask for approval, or add context for the agent.

## Events (Local harness)

| Event | Fires | Typical use |
| --- | --- | --- |
| `PreToolUse` | Before the agent uses a tool | Block or require approval |
| `PostToolUse` | After a tool succeeded | Format, validate |
| `SessionStart` | When a session starts | Add context |
| `UserPromptSubmit` | When you send a prompt | Audit |
| `Stop` | When the agent wants to finish | Check that tests ran |
| `PreCompact` | Before a long chat is summarised | Save state |
| `SubagentStart`, `SubagentStop` | Around subagents | Track delegated work |

## Locations and commands

| What | Where / how |
| --- | --- |
| Team hooks | `.github/hooks/*.json` plus the script, reviewed like code |
| Personal hooks | `~/.copilot/hooks/*.json` |
| Generate one | `/create-hook <description>` |
| See discovered hooks | `/hooks`, or **Chat: Configure Hooks** |
| Debug output | **Output** panel, channel **GitHub Copilot Chat Hooks** |

## Example: guard against destructive SQL and production

```json
// .github/hooks/guard.json
{
  "hooks": {
    "PreToolUse": [
      { "type": "command", "command": "node .github/hooks/guard.cjs", "timeout": 10 }
    ]
  }
}
```

```javascript
// .github/hooks/guard.cjs
// Denies any tool call whose input mentions destructive SQL or the prod profile.
let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => (input += chunk));
process.stdin.on('end', () => {
  const blocked = /DROP\s+(TABLE|SCHEMA|CATALOG)|TRUNCATE\s+TABLE|--profile[\s=]+prod/i.test(input);
  process.stdout.write(JSON.stringify(blocked
    ? { hookSpecificOutput: { hookEventName: 'PreToolUse', permissionDecision: 'deny',
        permissionDecisionReason: 'Blocked by team guard: destructive SQL or prod profile.' } }
    : { continue: true }));
});
```

`permissionDecision` can be `deny`, `ask` or `allow`.

## Gotchas

- **Harness-specific.** This format is for the Local harness. Copilot sessions on the Agent Host follow the GitHub Copilot hooks reference (the same as Copilot CLI). Event names, payloads and decisions differ; test in the harness the team uses.
- **Preview** in VS Code.
- **Needs a trusted workspace** and the setting `chat.useHooks` (on by default).
- **Find the exact tool names first** with a hook that only logs `tool_name`, then write rules against them.
- **Hooks are executable code.** Review every change; validate the JSON input before using values in a shell command; no secrets in hooks.
- **Terminal approval rules are not a block.** A `false` rule in `chat.tools.terminal.autoApprove` only asks for approval; only a hook returning `deny` blocks.
