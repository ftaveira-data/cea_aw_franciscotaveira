WITH customers AS (
    SELECT * FROM {{ ref('int_person__customer') }}
)
SELECT
  pk_customer AS customer_id,
  fk_person,
  fk_store,
  fk_territory,
  store_name,
  state_province_name,
  fk_country_region,
  customer_type
FROM {{ ref('int_person__customer') }}
