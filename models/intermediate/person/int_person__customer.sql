WITH 
  customers AS (
      SELECT * 
      FROM {{ ref('stg_sales__customers') }}
  )

, stores AS (
      SELECT * 
      FROM {{ ref('stg_sales__stores') }}
  )

, states_provinces AS (
      SELECT * 
      FROM {{ ref('stg_person__states_provinces') }}
  )

, enriched_customers AS (
    SELECT        
        customers.pk_customer,  
        customers.fk_person,  
        customers.fk_store,  
        customers.fk_territory,  
        stores.store_name,        
        states_provinces.state_province_name, 
        states_provinces.fk_country_region,

        -- Define o tipo de cliente
        CASE 
            WHEN customers.fk_person IS NOT NULL THEN 'Pessoa Física'
            ELSE 'Pessoa Jurídica'
        END AS customer_type,

        0 AS total_orders,
        0.0 AS total_revenue

    FROM customers
    LEFT JOIN stores ON customers.fk_store = stores.pk_store 
    LEFT JOIN states_provinces ON customers.fk_territory = states_provinces.fk_territory 
)

SELECT * FROM enriched_customers




