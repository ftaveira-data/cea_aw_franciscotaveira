WITH sales_data AS (
    SELECT 
        o.pk_sales_order,
        o.order_date,
        o.total_order_value,
        o.subtotal,
        o.tax_amount,
        o.freight_cost,
        o.quantity_ordered,
        o.unit_price_discount,
        c.customer_name,
        sp.pk_salesperson,
        sp.territory_name,
        sp.territory_region,
        sp.associated_store
    FROM {{ ref('int_sales__orders') }} o
    LEFT JOIN {{ ref('int_sales__customers') }} c ON o.fk_customer = c.pk_customer
    LEFT JOIN {{ ref('int_sales__salespersons') }} sp ON o.fk_salesperson = sp.pk_salesperson
)

, aggregated_metrics AS (
    SELECT
        territory_name,
        territory_region,
        associated_store,
        customer_name,
        pk_salesperson,
        COUNT(DISTINCT pk_sales_order) AS total_orders,
        SUM(total_order_value) AS total_revenue,
        SUM(subtotal) AS total_subtotal,
        SUM(tax_amount) AS total_tax,
        SUM(freight_cost) AS total_freight,
        SUM(quantity_ordered) AS total_quantity,
        SUM(unit_price_discount) AS total_discounts,
        SUM(total_order_value) / NULLIF(COUNT(DISTINCT pk_sales_order), 0) AS avg_order_value
    FROM sales_data
    GROUP BY 1,2,3,4,5
)

SELECT * FROM aggregated_metrics
