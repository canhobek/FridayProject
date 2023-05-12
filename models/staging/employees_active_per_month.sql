SELECT          YEAR(END_DATE)                          AS YEAR
                , MONTH(END_DATE)                       AS MONTH
                , COUNT(EMPLOYEE_ID)                    AS NUMBER_OF_ACTIVE_CONTRACTS
FROM {{ ref('employees') }}
WHERE END_DATE < '2023-12-31'
GROUP BY YEAR(END_DATE), MONTH(END_DATE)
ORDER BY YEAR(END_DATE), MONTH(END_DATE)