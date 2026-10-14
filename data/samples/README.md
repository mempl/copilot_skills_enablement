# data/samples: test inputs with a known answer

Real data has no answer key. To test a skill, you need an input where you already know what a correct run finds. Without it there is no test, only an impression.

Files here **are committed**, so they must be fictitious or fully anonymised.

No input of your own? `sql/fct_store_revenue_monthly.sql` is a ready-made test input for the `sql-style-review` starter idea, with planted violations of [docs/sql-style-rules.md](../../docs/sql-style-rules.md). The idea card is in [docs/templates/](../../docs/templates/idea-card-example-sql-style-review.md).

## Two ways to get one

1. **Plant errors in a copy.** Copy 20 to 50 rows of your input, anonymise them, and plant 3 to 5 problems the skill must find: a missing row, a wrong value, a duplicate key, a value that is *allowed* to differ. Write down what you planted.
2. **Use a slice you already checked.** A month or a table where you know the result because you did the check by hand.

## Write the expected result next to it

`<file>.expected.md`:

```markdown
# Expected result: inventory_sample.csv
- 3 real errors: row 12 (negative stock), row 27 (duplicate article_id), row 40 (missing warehouse)
- 1 allowed difference: row 8 (rounding ≤ 0.01)
- Result: FAIL
```

Then score every test run: found / expected, false alarms, format right or not. The test log template is in the workshop materials.
