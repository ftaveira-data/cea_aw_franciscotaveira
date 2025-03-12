WITH 
  reasons AS (
      SELECT * 
      FROM {{ ref('stg_sales__reasons') }}
  ),

  orders_sales_reasons AS (
      SELECT * 
      FROM {{ ref('stg_sales__orders_sales_reasons') }}
  ),

  sales_orders AS (
      SELECT * 
      FROM {{ ref('stg_sales__salesorders') }}
  ),

  enriched_sales_reasons AS (
      SELECT 
          orders_sales_reasons.fk_sales_order,  
          orders_sales_reasons.fk_sales_reason AS fk_reason, 
          reasons.reason_name,
          sales_orders.order_date,  
          sales_orders.total_due
          
      FROM orders_sales_reasons
      LEFT JOIN reasons ON orders_sales_reasons.fk_sales_reason = reasons.pk_sales_reason
      LEFT JOIN sales_orders ON orders_sales_reasons.fk_sales_order = sales_orders.pk_sales_order
  )

SELECT * FROM enriched_sales_reasons


