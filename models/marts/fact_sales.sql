WITH order_details AS (
    SELECT * FROM {{ ref('int_sales__salesorderdetail') }}
),

sales_orders AS (
    SELECT 
        pk_sales_order,
        fk_customer,
        order_date,
        total_due
    FROM {{ ref('stg_sales__salesorders') }}
)

SELECT 
    od.pk_sales_order_detail AS sales_order_detail_id,
    od.fk_sales_order AS sales_order_id,
    so.order_date,
    so.total_due,
    so.fk_customer AS customer_id,
    od.fk_product AS product_id,
    od.quantity_ordered,
    od.unit_price,
    od.unit_price_discount,

    -- Métricas padronizadas e documentáveis
    (od.quantity_ordered * od.unit_price) AS gross_amount,
    (od.quantity_ordered * od.unit_price_discount) AS discount_amount,
    (od.quantity_ordered * (od.unit_price - od.unit_price_discount)) AS net_amount

FROM order_details od
LEFT JOIN sales_orders so 
  ON od.fk_sales_order = so.pk_sales_order
