-- models/marts/core/dim_part.sql

{{ config(
    materialized='table',
    description='Dimensión de productos (partes) con información del catálogo.'
) }}

WITH stg_tpch__part as (
    select
        p_partkey as part_id,
        p_name,
        p_brand,
        p_type,
        p_size,
        p_container,
        p_retailprice,
        p_mfgr,
        p_comment,
        ingest_timestamp
    from {{ ref('stg_tpch__part') }}
) 

select 
    part_id,
    p_name,
    p_brand,
    p_type,
    p_size,
    p_container,
    p_retailprice,
    p_mfgr,
    p_comment,
    ingest_timestamp
from stg_tpch__part