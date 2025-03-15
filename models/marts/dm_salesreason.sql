WITH sales_reasons AS (
    SELECT * FROM {{ ref('int_sales__salesreason') }}
)

SELECT 
    fk_reason AS pk_sales_reason,
    reason_name
FROM sales_reasons
