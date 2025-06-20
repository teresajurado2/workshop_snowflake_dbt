-- models/marts/core/fct_orders.sql

{{ config(
    materialized='table',
    description='Tabla de hechos de pedidos con sus atributos clave para análisis de comportamiento y volumen.'
) }}

select
    o_orderkey as order_id,
    o_custkey as customer_id,
    o_orderstatus,
    o_totalprice,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment,
    ingest_timestamp
from {{ ref('stg_tpch__orders') }}
