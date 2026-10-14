Create a skill from this idea card.

Name: sql-style-review
When: before a pull request that touches dbt models or SQL files; for "style check", "code review", "Namenskonventionen prüfen"
Input: one .sql file
Steps:
1. Read the rules in docs/sql-style-rules.md (copy them into the skill as references/rules.md and link that file)
2. Check the file rule by rule
3. List every violation with line number and rule number
4. Propose a fix per violation
5. Self-check: every finding cites a rule and a line; no finding without a rule; formatting is out of scope
Copilot lacks: our 8 naming rules
Output: a table with columns line | rule | problem | fix, then a total count
Boundary: does not change files; not for formatting
Expected result on data/samples/sql/fct_store_revenue_monthly.sql: 7 violations
