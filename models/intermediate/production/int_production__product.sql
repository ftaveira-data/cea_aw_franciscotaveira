WITH 
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

  enriched_products AS (
      SELECT 
          products.pk_product,
          products.product_name,
          products.product_number,
          products.is_manufactured,
          products.is_finished_good,
          products.color,
          products.safety_stock_level,
          products.reorder_point,
          products.standard_cost,
          products.list_price,
          products.size,
          products.size_unit_measure,
          products.weight,
          products.weight_unit_measure,
          products.days_to_manufacture,
          products.fk_product_subcategory,
          product_subcategories.product_subcategory_name,
          product_subcategories.fk_product_category,
          product_categories.product_category_name
          
      FROM products
      LEFT JOIN product_subcategories 
          ON products.fk_product_subcategory = product_subcategories.pk_product_subcategory
      LEFT JOIN product_categories 
          ON product_subcategories.fk_product_category = product_categories.pk_product_category
  )

SELECT * FROM enriched_products
