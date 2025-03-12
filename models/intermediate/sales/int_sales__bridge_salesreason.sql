WITH sohr AS (
    SELECT
        fk_sales_order, 
        fk_sales_reason
    FROM {{ ref('stg_sales__orders_sales_reasons') }}
),

bridge_salesreason AS (
    SELECT 
        sohr.fk_sales_order AS sales_order_id,
        dsr.pk_sales_reason AS sales_reason_id,
        dsr.reason_name
    FROM sohr
    LEFT JOIN {{ ref('stg_sales__reasons') }} dsr
        ON sohr.fk_sales_reason = dsr.pk_sales_reason
)

SELECT * FROM bridge_salesreason

