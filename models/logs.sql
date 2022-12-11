select 
    *
from 
    {{target.schema}}_meta.{{try_dbt_log()}}
where 
    1=1
    and event_schema not like '%{{var('non_schema')}}'
