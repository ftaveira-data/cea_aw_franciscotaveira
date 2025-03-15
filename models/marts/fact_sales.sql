WITH order_details AS (
    SELECT * 
    FROM {{ ref('int_sales__salesorderdetail') }}
),

sales_orders AS (
    SELECT * 
    FROM {{ ref('stg_sales__salesorders') }}
),

customers AS (
    SELECT * 
    FROM {{ ref('dm_customer') }}
),

products AS (
    SELECT * 
    FROM {{ ref('dm_product') }}
),

stores AS (
    SELECT * 
    FROM {{ ref('dm_store') }}
),

sales_reasons AS (
    SELECT * 
    FROM {{ ref('dm_salesreason') }}
),

bridge_salesreason AS (
    SELECT * 
    FROM {{ ref('int_sales__bridge_salesreason') }}
),

fact_sales AS (
    SELECT 
        order_details.pk_sales_order_detail AS sales_order_detail_id,  
        order_details.fk_sales_order AS sales_order_id,
        sales_orders.order_date,
        sales_orders.total_due,
        customers.pk_customer,
        stores.pk_store,
        order_details.fk_product AS product_id,
        order_details.quantity_ordered,
        order_details.unit_price,
        order_details.unit_price_discount,
        (order_details.quantity_ordered * order_details.unit_price) AS total_price,
        (order_details.quantity_ordered * (order_details.unit_price - order_details.unit_price_discount)) AS net_price,
        sales_reasons.pk_sales_reason,
        sales_reasons.reason_name
    FROM order_details
    LEFT JOIN sales_orders ON order_details.fk_sales_order = sales_orders.pk_sales_order
    LEFT JOIN customers ON sales_orders.fk_customer = customers.pk_customer
    LEFT JOIN stores ON customers.fk_store = stores.pk_store
    LEFT JOIN products ON order_details.fk_product = products.pk_product
    LEFT JOIN bridge_salesreason ON order_details.fk_sales_order = bridge_salesreason.sales_order_id
    LEFT JOIN sales_reasons ON bridge_salesreason.sales_reason_id = sales_reasons.pk_sales_reason
)

SELECT * FROM fact_sales