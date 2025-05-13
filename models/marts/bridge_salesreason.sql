SELECT
    sales_order_id,
    sales_reason_id
FROM {{ ref('int_sales__bridge_salesreason') }}