{{
    config(
        materialized = 'table',
        pre_hook=["
            begin;
            lock table {{target.schema}}.products_orders;
        "],
        post_hook=["
            commit;
            grant usage on schema {{target.schema}} to group analytics;
            grant select on table {{target.schema}}.products_orders to group analytics;
        "]
    )
}}

select
    *
from 
    {{ref('denormalized')}}
