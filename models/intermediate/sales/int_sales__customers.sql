WITH customers AS (
    SELECT *
    FROM {{ ref('stg_sales__customers') }}
)

, stores AS (
    SELECT pk_store, store_name
    FROM {{ ref('stg_sales__stores') }}
)

, persons AS (
    SELECT pk_person, 
           CONCAT_WS(' ', first_name, middle_name, last_name) AS person_name
    FROM {{ ref('stg_person__people') }}
)

, sales_orders AS (
    SELECT fk_customer, account_number
    FROM {{ ref('stg_sales__salesorders') }}
    GROUP BY fk_customer, account_number 
)

, enriched_customers AS (
    SELECT 
        c.pk_customer,
        COALESCE(so.account_number, 'N/A') AS account_number,  
        c.fk_territory,
        COALESCE(s.store_name, p.person_name) AS customer_name,
        c.modified_date
    FROM customers c
    LEFT JOIN stores s ON c.fk_store = s.pk_store
    LEFT JOIN persons p ON c.fk_person = p.pk_person
    LEFT JOIN sales_orders so ON c.pk_customer = so.fk_customer  
)

SELECT * FROM enriched_customers
