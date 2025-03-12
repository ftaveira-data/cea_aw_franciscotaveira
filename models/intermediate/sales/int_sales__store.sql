WITH 
  stores AS (
      SELECT * 
      FROM {{ ref('stg_sales__stores') }}
  ),

  enriched_stores AS (
      SELECT 
          stores.pk_store,  
          stores.store_name,  
          stores.fk_salesperson,  
          stores.demographics  
      FROM stores
  )

SELECT * FROM enriched_stores


