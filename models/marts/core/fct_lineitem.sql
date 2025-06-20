-- models/marts/core/fct_lineitem.sql

{{ config(
    materialized='table',
    description='Tabla de hechos de líneas de pedido para análisis detallado de ventas, rentabilidad y logística.'
) }}


select
    l_orderkey as order_id,
    l_linenumber as line_number,
    l_partkey as part_id,
    l_suppkey as supplier_id,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax,
    l_returnflag,
    l_linestatus,
    l_shipdate,
    l_commitdate,
    l_receiptdate,
    l_shipinstruct,
    l_shipmode,
    l_comment,
    ingest_timestamp
from {{ ref('stg_tpch__lineitem') }}
