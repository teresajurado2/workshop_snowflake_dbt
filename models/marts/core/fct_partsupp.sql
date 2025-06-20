-- models/marts/core/fct_partsupp.sql

{{ config(
    materialized='table',
    description='Tabla de hechos que relaciona productos con proveedores incluyendo costos y disponibilidad.'
) }}

select
    ps_partkey as part_id,
    ps_suppkey as supplier_id,
    ps_availqty,
    ps_supplycost,
    ps_comment,
    ingest_timestamp
from {{ ref('stg_tpch__partsupp') }}
