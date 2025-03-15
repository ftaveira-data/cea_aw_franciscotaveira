WITH stores AS (
    SELECT * FROM {{ ref('int_sales__store') }}
)

SELECT *
FROM stores
