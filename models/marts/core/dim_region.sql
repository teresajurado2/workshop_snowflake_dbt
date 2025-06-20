-- models/marts/core/dim_region.sql

{{ config(
    materialized='table',
    description='Dimensión de regiones geográficas.'
) }}

WITH stg_tpch__region as (
select
    r_regionkey as region_id,
    r_name as region_name,
    r_comment,
    ingest_timestamp
from {{ ref('stg_tpch__region') }}

)
select region_id,
    region_name,
    r_comment,
    ingest_timestamp
from stg_tpch__region