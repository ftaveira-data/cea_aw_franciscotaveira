WITH products AS (
    SELECT * FROM {{ ref('int_production__product') }}
)

SELECT
    pk_product AS product_id,
    product_name,
    product_number,
    product_category_name,
    product_subcategory_name,
    color,
    size,
    size_unit_measure,
    weight,
    standard_cost,
    list_price
FROM products
