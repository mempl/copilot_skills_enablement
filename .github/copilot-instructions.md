# Sales reporting migration (legacy DWH -> Databricks)
- Purpose: rebuild the monthly sales reports on Databricks and prove they match the legacy output. Business context: [docs/business-context.md](../docs/business-context.md).
- Layout: `data/samples/legacy-dwh/` and `data/samples/databricks/` fictitious CSV extracts, `dbt/` SQL models, `docs/` documentation.
- Naming: snake_case, English names, tables as `catalog.schema.table`.
- Data: amounts in EUR with 2 decimals; dates ISO `YYYY-MM-DD`. Legacy extracts use `;` as separator, `DD.MM.YYYY` dates and a decimal comma.
- Code: pandas for local checks, PySpark in notebooks; no hard-coded paths or credentials.
- Never invent figures or results; compute them with code and show the code.
- Answer in the language of the question; code and comments in English.
