with rawdata as (

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * power(2, 0)
     + 
    
    p1.generated_number * power(2, 1)
     + 
    
    p2.generated_number * power(2, 2)
     + 
    
    p3.generated_number * power(2, 3)
     + 
    
    p4.generated_number * power(2, 4)
     + 
    
    p5.generated_number * power(2, 5)
     + 
    
    p6.generated_number * power(2, 6)
     + 
    
    p7.generated_number * power(2, 7)
     + 
    
    p8.generated_number * power(2, 8)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
    
    

    )

    select *
    from unioned
    where generated_number <= 287
    order by generated_number



),

all_periods as (

    select (
        

    dateadd(
        month,
        row_number() over (order by 1) - 1,
        '2000-01-01'
        )


    ) as date_month
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_month <= '2023-12-30'

), 
can_date as (

select left(date_month, 10) AS date_month
from filtered
)

SELECT TRY_TO_DATE(date_month)                       AS date 
        , YEAR(date)                    AS year
        , QUARTER(date)                 AS quarter
        , MONTH(date)                   AS month
FROM can_date