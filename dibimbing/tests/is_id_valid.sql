{% test is_id_valid(model, column_name) %}

    select 1
    from {{ model }}
    Where not REGEXP_CONTAINS({{ column_name }}, "^[0-9]+")

{% endtest %}