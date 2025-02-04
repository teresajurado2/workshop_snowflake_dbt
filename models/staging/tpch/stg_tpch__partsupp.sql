with 

source as (

    select * from {{ source('tpch', 'partsupp') }}

),

renamed as (

    select
        ps_partkey,
        ps_suppkey,
        ps_availqty,
        ps_supplycost,
        ps_comment,
        ingest_timestamp

    from source

)

select * from renamed
