-- models/marts/core/dim_customer.sql

{{ config(
    materialized='table',
    description='Dimensión de clientes con información geográfica (nation y region).'
) }}

with stg_tpch__customer as (
    select
        c_custkey as customer_id,
        c_name,
        c_address,
        c_nationkey as nation_id,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment,
        ingest_timestamp
    from {{ ref('stg_tpch__customer') }}
)

select  customer_id,
        c_name,
        c_address,
        nation_id,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment,
        ingest_timestamp 
from stg_tpch__customer
