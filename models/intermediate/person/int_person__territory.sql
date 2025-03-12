WITH 
  territories AS (
      SELECT * 
      FROM {{ ref('stg_sales__territories') }}
  )

, states_provinces AS (
      SELECT * 
      FROM {{ ref('stg_person__states_provinces') }}
  )

, enriched_territories AS (
    SELECT        
        territories.pk_territory,  
        territories.territory_name,  
        states_provinces.state_province_name,  
        states_provinces.fk_country_region,  
        states_provinces.state_province_code  

    FROM territories
    LEFT JOIN states_provinces ON territories.pk_territory = states_provinces.fk_territory
)

SELECT * FROM enriched_territories
