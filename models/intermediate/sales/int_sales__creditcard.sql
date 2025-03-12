WITH 
  credit_cards AS (
      SELECT * 
      FROM {{ ref('stg_sales__credit_cards') }}
  ),

  sales_orders AS (
      SELECT * 
      FROM {{ ref('stg_sales__salesorders') }}
  ),

  enriched_credit_cards AS (
      SELECT 
          credit_cards.pk_creditcard,  
          sales_orders.pk_sales_order,
          sales_orders.order_date,
          sales_orders.total_due,
          credit_cards.card_type,  
          credit_cards.exp_month,  
          credit_cards.exp_year  
          
      FROM sales_orders
      LEFT JOIN credit_cards 
          ON sales_orders.fk_credit_card = credit_cards.pk_creditcard
  )

SELECT * FROM enriched_credit_cards
