with aux as (
select 
    *
    , row_number() over (partition by company_name, contact_name order by company_name) as rw_num
from 
    {{source('northwind_source', 'customers')}}
)
select 
    *
from 
    aux
where 
    rw_num = 1