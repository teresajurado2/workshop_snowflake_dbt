-- models/marts/gold/gold_project_3_profitability_analysis.sql

{{ config(
    materialized='table',
    description='Vista de rentabilidad por línea de pedido incluyendo descuentos y costos de suministro.'
) }}

with lineitem as (
    select * from {{ ref('fct_lineitem') }}
),
partsupp as (
    select * from {{ ref('fct_partsupp') }}
)

select
    l.order_id,
    l.line_number,
    l.part_id,
    l.supplier_id,
    l.quantity,
    l.extendedprice,
    l.discount,
    ps.ps_supplycost,
    (l.extendedprice * (1 - l.discount)) - (l.quantity * ps.ps_supplycost) as gross_margin,
    l.ingest_timestamp
from lineitem l
left join partsupp ps
    on l.part_id = ps.part_id and l.supplier_id = ps.supplier_id
