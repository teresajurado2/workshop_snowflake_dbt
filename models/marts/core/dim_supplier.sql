-- models/marts/core/dim_supplier.sql

{{ config(
    materialized='table',
    description='Dimensión de proveedores con información básica y país.'
) }}

select
    s_suppkey as supplier_id,
    s_name,
    s_address,
    s_phone,
    s_acctbal,
    s_nationkey as nation_id,
    s_comment,
    ingest_timestamp
from {{ ref('stg_tpch__supplier') }}
