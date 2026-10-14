# Business context (team DNA)

The shared business part of the team DNA. Fictitious example for the workshop.

## Domain

Monthly sales reporting for a retail chain with about 40 stores and three product groups (fresh, dry, non-food). The team migrates the monthly revenue reports from the legacy data warehouse to Databricks and proves for each report that the new output matches the old one.

## Stakeholders

- **Controlling:** uses the monthly revenue report; signs off each migrated report.
- **Migration lead:** decides which differences between old and new are accepted.
- **Data platform team:** owns the Databricks workspace and deployments.

## Systems

- **Legacy DWH:** produces today's reports; delivers CSV extracts.
- **Databricks with Unity Catalog:** target platform for all migrated reports.
- **Power BI:** consumes the migrated tables.

## Strategic priorities

1. Migrate every monthly report with a signed-off reconciliation.
2. Make reconciliation repeatable, so each report and month is checked the same way.
3. Document every migrated table in the team format.

## Current pain points

- Reconciliation is done by hand and differs from person to person.
- Legacy column names are cryptic and undocumented.
- Accepted differences are known only to a few people.

## Standard deliverables

- A reconciliation report per report and month.
- Table documentation for every migrated table.
- Pull request descriptions in the team format.

## Success metrics

- Reports signed off by Controlling.
- No unexplained differences in a signed-off reconciliation.

## Constraints and boundaries

- **Must comply with:** internal data classification; no personal data in repositories or prompts.
- **Must not expose:** credentials, real figures, customer data.
- **Must avoid:** changes to production outside the CI/CD pipeline.

## AI operating principles (team)

- Never invent figures, tables, dependencies or results.
- Separate facts from assumptions; list open assumptions at the end.
- Escalate to a human when a difference cannot be classified with certainty.
