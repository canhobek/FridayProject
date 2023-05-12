SELECT      EMPLOYEE_ID
            , DATEDIFF('days', START_DATE, END_DATE)                    AS NUMBER_OF_DAYS_CONTRACT
FROM {{ ref('employees') }}
WHERE LEFT(END_DATE, 4) != 9999