WITH customers AS (
    SELECT * FROM {{ ref('int_person__customer') }}
)

SELECT 
    pk_customer,
    fk_person,
    fk_store,
    fk_territory,
    store_name,
    state_province_name,
    fk_country_region,
    customer_type
FROM customers
