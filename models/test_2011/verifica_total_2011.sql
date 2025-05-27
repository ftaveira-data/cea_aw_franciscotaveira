SELECT
  ROUND(SUM(gross_amount), 2) AS total_vendido_2011
FROM {{ ref('fact_sales') }}
WHERE YEAR(order_date) = 2011
