# Data

Small, fictitious samples for exercises and demos. They are committed on purpose, so everyone works with the same inputs.

**Rules**

- Fictitious data only. Real extracts never go into this repository.
- Under 1 MB per file.
- File names: `<report>_<YYYY-MM>.csv`.
- Large or generated files (`*.parquet`, exports) are ignored by Git.

| Folder | Content |
| --- | --- |
| `samples/legacy-dwh/` | Report extracts as delivered by the legacy DWH |
| `samples/databricks/` | The same reports produced by the new platform |
| `samples/sql/` | A dbt model with planted style violations, for the `sql-style-review` starter idea (rules: `docs/sql-style-rules.md`, idea card: `docs/idea-card-sql-style-review.md`) |
