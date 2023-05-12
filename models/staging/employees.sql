{{ config(
  post_hook = "alter table {{ this }} add row access policy PRODUCTION_DB.POLICIES.EMPLOYEES_POLICY on (TEAM);"
) }}

SELECT EMPLOYEE_ID
        , TO_DATE(DATE_1, 'DD-MM-YYYY')                     AS START_DATE
        , TO_DATE(DATE_2, 'DD-MM-YYYY')                      AS END_DATE
        , TEAM
FROM {{ source('public', 'employees') }}