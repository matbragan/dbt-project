select 
    * 
    , first_name + ' ' + last_name as name
    , datediff('year', birth_date, current_date) as age
    , datediff('year', hire_date, current_date) as service_age
from 
    {{source('northwind_source', 'employees')}}