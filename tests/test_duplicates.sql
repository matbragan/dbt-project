select
    count(1) as _count
    , company_name
    , contact_name
from 
    {{ref('customers')}}
group by 2, 3
having _count > 1
