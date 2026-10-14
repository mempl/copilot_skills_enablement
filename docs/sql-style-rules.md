# SQL style rules (dbt models)

Fictitious team rules for the `sql-style-review` starter idea. Test input: [data/samples/sql/fct_store_revenue_monthly.sql](../data/samples/sql/fct_store_revenue_monthly.sql), with planted violations.

| # | Rule | Good | Bad |
| --- | --- | --- | --- |
| 1 | Model files and CTE names are lowercase snake_case | `monthly_revenue` | `monthlyRevenue` |
| 2 | Column names are English snake_case | `net_revenue_eur` | `UMS_NETTO` |
| 3 | No `select *`; list the columns | `select store_id, store_name` | `select *` |
| 4 | Reference models with `{{ ref() }}` and sources with `{{ source() }}`; never hard-code `catalog.schema.table` | `{{ source('sales', 'sales_daily') }}` | `prod_catalog.sales.sales_daily` |
| 5 | No single-letter table aliases | `from sales` | `from sales as s` |
| 6 | Boolean columns start with `is_` or `has_` | `is_active` | `store_active` |
| 7 | Date columns end in `_date`, timestamps in `_ts` | `month_start_date` | `month_start` |
| 8 | Money columns end in the currency | `revenue_eur` | `revenue` |

Formatting (keyword case, indentation, commas) is left to the formatter and is **not** part of this review.
