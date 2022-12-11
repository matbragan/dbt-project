{% macro try_dbt_log() %}
    {{ stg_dbt_audit_log | dbt_audit_log }}
{% endmacro %}