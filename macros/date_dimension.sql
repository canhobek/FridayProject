{% set sql_statement_1 %}
    select min(start_date)::string from {{ ref('employees') }}
{% endset %}
{%- set first_date = dbt_utils.get_single_value(sql_statement_1, default="'2017-01-01'") -%}

{% set sql_statement_2 %}
    select max(end_date)::string from {{ ref('employees') }} where left(end_date, 4) != 9999
{% endset %}
{%- set last_date = dbt_utils.get_single_value(sql_statement_2, default="'2017-01-01'") -%}


{{ dbt_utils.date_spine(
                        datepart="month",
                        start_date="'" + first_date + "'",
                        end_date="'" + last_date + "'"
    )
}}