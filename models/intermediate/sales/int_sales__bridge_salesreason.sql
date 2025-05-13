WITH base AS (
    SELECT
        fk_sales_order,
        fk_sales_reason
    FROM {{ ref('stg_sales__orders_sales_reasons') }}
),

validated_reasons AS (
    SELECT
        pk_sales_reason
    FROM {{ ref('stg_sales__reasons') }}
)

SELECT
    base.fk_sales_order AS sales_order_id,
    base.fk_sales_reason AS sales_reason_id
FROM base
INNER JOIN validated_reasons
    ON base.fk_sales_reason = validated_reasons.pk_sales_reason

