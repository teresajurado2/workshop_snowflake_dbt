{{ config(
    materialized='table',
    description='Vista analítica con información de cliente, país y región.'
) }}

with customer as (
    select * from {{ ref('dim_customer') }}
),
nation as (
    select * from {{ ref('dim_nation') }}
),
region as (
    select * from {{ ref('dim_region') }}
)

select
    c.customer_id,
    c.c_name,
    c.c_address,
    c.c_phone,
    c.c_acctbal,
    c.c_mktsegment,
    c.c_comment,
    n.nation_name,
    r.region_name,
    c.ingest_timestamp as customer_ingest_ts
from customer c
left join nation n on c.nation_id = n.nation_id
left join region r on n.region_id = r.region_id