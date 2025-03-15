WITH 
  stores AS (
      SELECT * 
      FROM {{ ref('stg_sales__stores') }}
  ),

  customers AS (
      SELECT DISTINCT fk_store, fk_territory
      FROM {{ ref('int_person__customer') }}
  ),

  states_provinces AS (
      SELECT 
          fk_territory,
          state_province_name,
          fk_country_region
      FROM {{ ref('stg_person__states_provinces') }}
  ),

  enriched_stores AS (
      SELECT 
          stores.pk_store,  
          stores.store_name,  
          stores.fk_salesperson,  
          stores.demographics,
          customers.fk_territory, 
          states_provinces.state_province_name,
          states_provinces.fk_country_region
          
      FROM stores
      LEFT JOIN customers ON stores.pk_store = customers.fk_store 
      LEFT JOIN states_provinces ON customers.fk_territory = states_provinces.fk_territory
  )

SELECT * FROM enriched_stores





