{{
    config(
        materialized='incremental',
        unique_key = 'EMPLOYEE_ID'
    )
}}

SELECT EMPLOYEE_ID
        , START_DATE
        , END_DATE
        , TEAM
        , TIME_STAMP
FROM {{ ref('employees') }}

{% if is_incremental() %}
    where TIME_STAMP > (select MAX(TIME_STAMP) from {{ this }}) 
{% endif %}