WITH order_details AS (
    SELECT * 
    FROM {{ ref('stg_sales__orders_details') }}
),

products AS (
    SELECT * 
    FROM {{ ref('stg_production__products') }}
),

product_subcategories AS (
    SELECT * 
    FROM {{ ref('stg_production__product_subcategories') }}
),

product_categories AS (
    SELECT * 
    FROM {{ ref('stg_production__product_categories') }}
),

enriched_order_details AS (
    SELECT 
        order_details.pk_sales_order_detail,  
        order_details.fk_sales_order,  
        order_details.fk_product,  
        order_details.quantity_ordered,  
        order_details.unit_price,  
        order_details.unit_price_discount,  
        products.product_name,
        product_subcategories.pk_product_subcategory,
        product_categories.pk_product_category
    FROM order_details
    LEFT JOIN products 
        ON order_details.fk_product = products.pk_product
    LEFT JOIN product_subcategories 
        ON products.fk_product_subcategory = product_subcategories.pk_product_subcategory
    LEFT JOIN product_categories
        ON product_subcategories.fk_product_category = product_categories.pk_product_category
)

SELECT * FROM enriched_order_details


