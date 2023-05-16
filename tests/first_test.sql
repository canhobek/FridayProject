{{
    config(
        schema = 'test_schema',
        store_failures = true
    )
}}

with employees as (
    SELECT * FROM {{ ref('employees') }}
)

SELECT
    EMPLOYEE_ID
    , COUNT(team) AS EMPLOYEES_COUNT_OF_TEAM
FROM employees
GROUP BY EMPLOYEE_ID
HAVING EMPLOYEES_COUNT_OF_TEAM > 1