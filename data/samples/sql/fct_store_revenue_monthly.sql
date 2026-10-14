-- Monthly net revenue per active store
with sales as (
    select *
    from prod_catalog.sales.sales_daily
),

stores as (
    select
        store_id,
        store_name,
        active as store_active
    from {{ ref('dim_store') }}
),

monthlyRevenue as (
    select
        s.store_id,
        date_trunc('month', s.posting_date) as month_start,
        sum(s.net_revenue_eur) as revenue,
        sum(s.quantity) as quantity
    from sales as s
    group by 1, 2
)

select
    monthlyRevenue.store_id,
    stores.store_name,
    monthlyRevenue.month_start,
    monthlyRevenue.revenue,
    monthlyRevenue.quantity
from monthlyRevenue
inner join stores
    on monthlyRevenue.store_id = stores.store_id
where stores.store_active
