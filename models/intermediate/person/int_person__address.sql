WITH 
  addresses AS (
      SELECT * 
      FROM {{ ref('stg_person__addresses') }}
  )

, states_provinces AS (
      SELECT * 
      FROM {{ ref('stg_person__states_provinces') }}
  )

, enriched_addresses AS (
    SELECT        
        addresses.pk_address,  
        addresses.address_line1,           
        addresses.city,  
        addresses.fk_state_province,  
        states_provinces.state_province_name, 
        states_provinces.fk_country_region,
        states_provinces.state_province_code,

        -- Define um identificador único de localização
        CONCAT(addresses.city, ', ', states_provinces.state_province_name, ' - ', states_provinces.fk_country_region) AS full_location
        
    FROM addresses
    LEFT JOIN states_provinces ON addresses.fk_state_province = states_provinces.pk_state_province
)

SELECT * FROM enriched_addresses
