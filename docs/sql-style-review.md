# Starter idea: SQL style review, step by step

A ready-made first skill for anyone without an input of their own. Everything you need is in the repo; about 20 minutes.

| File | What |
| --- | --- |
| [docs/sql-style-rules.md](sql-style-rules.md) | The 8 team rules the skill checks |
| [data/samples/sql/fct_store_revenue_monthly.sql](../data/samples/sql/fct_store_revenue_monthly.sql) | Test input: a dbt model with planted violations. Don't fix it |
| [docs/templates/idea-card-example-sql-style-review.md](templates/idea-card-example-sql-style-review.md) | The filled idea card you paste into `/create-skill` |

**Expected result:** 7 violations, at most one per rule. Rule 2 is not violated anywhere.

## 1. Branch and settings

```bash
git switch -c my-sql-review bare-bare
```

In the chat: session target **Local**, mode **Agent**, **Manual permissions**.

## 2. Read before you build (2 min)

Open the rules and the test model side by side. Don't fix the model and don't write the answers down in the repo: Copilot reads the workspace, and a written-down answer spoils the test.

## 3. Create the skill (3 min)

New chat. Type `/create-skill`, then paste the whole idea card from `docs/templates/idea-card-example-sql-style-review.md`.

Review the diff before you click **Keep**:

- [ ] Folder `.github/skills/sql-style-review/` and `name: sql-style-review` are identical
- [ ] The description says **when**, with words people type ("style check", "code review", "Namenskonventionen prüfen")
- [ ] `references/rules.md` exists **and** is linked from `SKILL.md`
- [ ] The output is a fixed table: line, rule, problem, fix

## 4. Check discovery (1 min)

New chat, type `/skills`: `sql-style-review` must be listed. If not: **Developer: Reload Window**. Still missing: the name differs from the folder, or the YAML broke on a colon in the description.

## 5. Test (5 min)

Always a **new chat** per test.

**Natural prompt**, tests the description:

```text
Mach bitte einen Style-Check für data/samples/sql/fct_store_revenue_monthly.sql, bevor ich den PR aufmache.
```

Expand **Used n references**: `SKILL.md` and `rules.md` should be listed. If the skill isn't used, call it directly:

```text
/sql-style-review data/samples/sql/fct_store_revenue_monthly.sql
```

## 6. Score it

| Run | Found / 7 | False alarms | Table format OK | What I changed afterwards |
| --- | --- | --- | --- | --- |
| 1 | / 7 | | | |
| 2 | / 7 | | | |

- **Found:** real violations of the 8 rules.
- **False alarm:** a finding without a rule, e.g. lowercase keywords, `group by 1, 2`, indentation. These are formatting, not rules.
- **The same name reported on several lines** counts once.

## 7. Refine by symptom (one change per run)

| Symptom | Change in `SKILL.md` or `rules.md` |
| --- | --- |
| Misses violations | Step: "Check the file rule by rule, 1 to 8, and list every line that violates the rule" |
| Formatting reported | Rule: "Report only the 8 rules; formatting (keyword case, indentation, `group by 1, 2`) is out of scope" |
| Same name reported many times | Step: "A name used on several lines counts once, at the line where it is defined" |
| Output looks different each run | Add `assets/output-template.md` with the table and link it |
| Unsure findings mixed with sure ones | Rule: "If unsure, list it under *Unsure*, not as a violation" |
| Changes the file | Rule: "Report only. Never edit the input file." |

## 8. Harder tests (if you have time)

- **Stability:** the same prompt in a second new chat. Same result?
- **Sensitivity:** copy the model to `data/samples/sql/fct_store_revenue_monthly_v2.sql` and plant one more violation, e.g. rename `store_name` to `StoreName` (rule 2). Is it found?

## 9. Commit

```bash
git add .github/skills/sql-style-review
git commit -m "Add sql-style-review skill"
```

Add a row to the skills index in [.github/skills/README.md](../.github/skills/README.md) with yourself as owner.

