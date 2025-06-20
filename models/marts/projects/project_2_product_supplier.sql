-- models/marts/gold/gold_project_2_product_supplier.sql

{{ config(
    materialized='table',
    description='Vista que relaciona proveedores con productos suministrados.'
) }}

with part as (
    select * from {{ ref('dim_part') }}
),
supplier as (
    select * from {{ ref('dim_supplier') }}
),
partsupp as (
    select * from {{ ref('fct_partsupp') }}
)

select
    p.part_id,
    p.p_name,
    p.p_brand,
    p.p_type,
    p.p_size,
    p.p_container,
    p.p_retailprice,
    p.p_mfgr,
    s.supplier_id,
    s.s_name,
    s.s_address,
    s.s_phone,
    s.s_acctbal,
    ps.ps_availqty,
    ps.ps_supplycost,
    ps.ps_comment,
    ps.ingest_timestamp
from partsupp ps
left join part p on ps.part_id = p.part_id
left join supplier s on ps.supplier_id = s.supplier_id