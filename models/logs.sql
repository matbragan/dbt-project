select 
    *
from 
    {{target.schema}}_meta.dbt_audit_log
where 
    event_schema <> ''
