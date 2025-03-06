WITH order_reasons AS (
    SELECT 
        fk_sales_order, 
        fk_sales_reason
    FROM {{ ref('stg_sales__orders_sales_reasons') }}
)

, reasons AS (
    SELECT 
        pk_sales_reason,
        reason_name,
        reason_type
    FROM {{ ref('stg_sales__reasons') }}
)

, enriched_sales_reasons AS (
    SELECT 
        orr.fk_sales_order,
        r.pk_sales_reason,
        r.reason_name,
        r.reason_type
    FROM order_reasons orr
    LEFT JOIN reasons r ON orr.fk_sales_reason = r.pk_sales_reason 
)

SELECT * FROM enriched_sales_reasons
