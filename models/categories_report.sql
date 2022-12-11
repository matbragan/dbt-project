{{
    config(
        materialized='table'
    )
}}

select
    *
from 
    {{source('northwind_source', 'categories')}}
