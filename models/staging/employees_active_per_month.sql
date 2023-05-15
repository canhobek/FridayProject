SELECT COUNT(employees.EMPLOYEE_ID)         AS number_of_employees
    , date_spine.MONTH
    , date_spine.YEAR
FROM {{ ref('date_spine') }}    AS date_spine
LEFT JOIN employees
    ON employees.start_date <= date_spine.date AND employees.end_date >= date_spine.date
GROUP BY MONTH, YEAR
ORDER BY YEAR