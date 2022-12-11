{% macro try_dbt_log() %}
    {{return('stg_dbt_audit_log')}}
{% endmacro %}

{% macro columns_dbt_log() %}
    {{return('event_name, event_timestamp')}}
{% endmacro %}