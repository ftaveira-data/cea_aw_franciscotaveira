WITH stores AS (
    SELECT * 
    FROM {{ ref('stg_sales__stores') }}
)

SELECT
    pk_store,
    store_name,
    fk_salesperson,
    demographics
FROM stores





