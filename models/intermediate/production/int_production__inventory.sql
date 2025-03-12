WITH 
  inventory AS (
      SELECT * 
      FROM {{ ref('stg_production__inventory') }}
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

  enriched_inventory AS (
      SELECT 
          inventory.fk_product, -- 🔹 Removido PK_INVENTORY
          inventory.fk_location,
          inventory.quantity,
          inventory.shelf,
          inventory.bin,
          products.product_name,
          product_subcategories.product_subcategory_name,
          product_categories.product_category_name

      FROM inventory
      LEFT JOIN products 
          ON inventory.fk_product = products.pk_product
      LEFT JOIN product_subcategories 
          ON products.fk_product_subcategory = product_subcategories.pk_product_subcategory
      LEFT JOIN product_categories 
          ON product_subcategories.fk_product_category = product_categories.pk_product_category
  )

SELECT * FROM enriched_inventory
