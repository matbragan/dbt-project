select 
    *
from 
    {{target.schema}}_meta.dbt_audit_log
where 
    1=1
    and event_schema not like '%_meta'
    and event_model <> 'logs'
