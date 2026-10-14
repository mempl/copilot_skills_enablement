# Accepted differences (signed off by the migration lead)

- **Rounding:** the legacy system rounds per receipt, the new platform per line. An absolute difference of up to 0.01 EUR per row in `net_revenue_eur` is accepted.
- **Test store 1099** is not migrated. Exclude its legacy rows before comparing.
