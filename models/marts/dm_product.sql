WITH products AS (
    SELECT * FROM {{ ref('int_production__product') }}
)

SELECT *
    
FROM products
