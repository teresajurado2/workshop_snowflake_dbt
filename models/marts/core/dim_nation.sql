-- models/marts/core/dim_nation.sql

{{ config(
    materialized='table',
    description='Dimensión de países con referencia a regiones.'
) }}

with stg_tpch__nation as (
select
    n_nationkey as nation_id,
    n_name as nation_name,
    n_regionkey as region_id,
    n_comment,
    ingest_timestamp
from {{ ref('stg_tpch__nation') }}
)

select  nation_id,
        nation_name,
        region_id,
        n_comment
        ,ingest_timestamp
from stg_tpch__nation
