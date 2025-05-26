WITH stores AS (
    SELECT * FROM {{ ref('int_sales__store') }}
)
SELECT
  pk_store AS store_id,
  store_name,
  fk_salesperson,
  demographics
FROM {{ ref('int_sales__store') }}
