WITH 
  employees AS (
      SELECT * 
      FROM {{ ref('stg_sales__salesperson') }}
  )

, states_provinces AS (
      SELECT * 
      FROM {{ ref('stg_person__states_provinces') }}
  )

, enriched_employees AS (
    SELECT        
        employees.pk_salesperson,  
        employees.fk_territory,  
        employees.sales_quota,  
        employees.bonus,  
        employees.commission_pct,  
        employees.sales_ytd,  
        employees.sales_last_year,  
        states_provinces.state_province_name, 
        states_provinces.fk_country_region,
        states_provinces.state_province_code,

        -- Define um identificador único do vendedor
        CONCAT('Salesperson ', employees.pk_salesperson, ' - ', states_provinces.state_province_name) AS salesperson_identifier

    FROM employees
    LEFT JOIN states_provinces ON employees.fk_territory = states_provinces.fk_territory
)

SELECT * FROM enriched_employees