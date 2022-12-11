{{
    config(
        materialized = 'table',
        post_hook=["
            grant usage on schema {{target.schema}} to group analytics;
            grant select on table {{target.schema}}.products_orders to group analytics;
        "]
    )
}}

select
    *
from 
    {{ref('denormalized')}}
