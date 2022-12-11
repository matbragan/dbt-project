select 
    a.*
    , b.email
from
    {{source('northwind_source', 'shippers')}} a
    left join {{ref('shippers_emails')}} b on a.shipper_id = b.shipper_id
