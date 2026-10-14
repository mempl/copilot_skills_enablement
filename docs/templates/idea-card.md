# Template: idea card

Fill it, then paste the whole card after `/create-skill`.

```text
Create a skill from this idea card.

Name:           <lowercase-with-hyphens, max 64 characters>
When:           <the situation, plus the words colleagues type, in German and English>
Input:          <one file in data/input/ or data/samples/; its format>
Steps:
1. <one checkable action>
2. <...>        (3 to 7 steps; keep find, judge and fix in separate steps; counts and sums by code)
Copilot lacks:  <the rule list, mapping, threshold or template it can't guess; where that file is>
Output:         <a fixed format: table columns or a template>
Boundary:       <what it does NOT do, e.g. "does not change files">
Expected:       <what a correct run finds on data/samples/<file>>
```

Too big if the name needs an "and", it has more than 7 steps, or there is no test input.

Put the knowledge Copilot lacks into a file **before** you run `/create-skill` (e.g. `docs/rules.md`) and name it in the card. `/create-skill` writes the structure; it can't invent your rules.
