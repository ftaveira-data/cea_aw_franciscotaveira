WITH customers AS (
    SELECT * 
    FROM {{ ref('stg_sales__customers') }}
),

dedup_stores AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY pk_store ORDER BY store_name) AS rn
        FROM {{ ref('stg_sales__stores') }}
    )
    WHERE rn = 1
),

dedup_states_provinces AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY fk_territory ORDER BY state_province_name) AS rn
        FROM {{ ref('stg_person__states_provinces') }}
    )
    WHERE rn = 1
),

enriched_customers AS (
    SELECT        
        customers.pk_customer,  
        customers.fk_person,  
        customers.fk_store,  
        customers.fk_territory,  

        stores.store_name,        
        states.state_province_name, 
        states.fk_country_region,

        CASE 
            WHEN customers.fk_person IS NOT NULL THEN 'Pessoa Física'
            ELSE 'Pessoa Jurídica'
        END AS customer_type,

        0 AS total_orders,
        0.0 AS total_revenue

    FROM customers
    LEFT JOIN dedup_stores AS stores 
        ON customers.fk_store = stores.pk_store 

    LEFT JOIN dedup_states_provinces AS states 
        ON customers.fk_territory = states.fk_territory 
)

SELECT * 
FROM enriched_customers




