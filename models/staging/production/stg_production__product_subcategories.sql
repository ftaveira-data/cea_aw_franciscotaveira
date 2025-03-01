WITH product_subcategory_raw AS (
    SELECT *
    FROM {{ source('production', 'ProductSubcategory') }}
)

, renamed AS (
    SELECT
        CAST(ProductSubcategoryID AS INT) AS pk_product_subcategory -- Chave primária da subcategoria
      , CAST(ProductCategoryID AS INT) AS fk_product_category -- Chave estrangeira para categoria
      , CAST(Name AS STRING) AS product_subcategory_name -- Nome da subcategoria
      , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
      , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM product_subcategory_raw
)

SELECT * FROM renamed
