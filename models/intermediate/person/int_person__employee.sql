WITH 
  employees AS (
      SELECT * 
      FROM {{ ref('stg_sales__salesperson') }}
  ),

  states_provinces_raw AS (
      SELECT * 
      FROM {{ ref('stg_person__states_provinces') }}
  ),

  territory_dedup AS (
      SELECT
          fk_territory,
          MIN(state_province_name) AS state_province_name,
          MIN(state_province_code) AS state_province_code,
          MIN(fk_country_region) AS fk_country_region
      FROM states_provinces_raw
      GROUP BY fk_territory
  ),

  enriched_employees AS (
    SELECT        
        employees.pk_salesperson,  
        employees.fk_territory,  
        employees.sales_quota,  
        employees.bonus,  
        employees.commission_pct,  
        employees.sales_ytd,  
        employees.sales_last_year,  

        territory_dedup.state_province_name, 
        territory_dedup.fk_country_region,
        territory_dedup.state_province_code,

        -- Identificador legível do vendedor
        CONCAT('Salesperson ', employees.pk_salesperson, ' - ', territory_dedup.state_province_name) AS salesperson_identifier

    FROM employees
    LEFT JOIN territory_dedup 
        ON employees.fk_territory = territory_dedup.fk_territory
  )

SELECT * FROM enriched_employees
