WITH sales_reasons AS (
    SELECT * FROM {{ ref('int_sales__salesreason') }}
)

SELECT
  pk_sales_reason AS sales_reason_id,
  reason_name
FROM {{ ref('stg_sales__reasons') }}
