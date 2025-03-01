WITH product_category_raw AS (
    SELECT *
    FROM {{ source('production', 'ProductCategory') }}
)

, renamed AS (
    SELECT
        CAST(ProductCategoryID AS INT) AS pk_product_category -- Chave primária da categoria
      , CAST(Name AS STRING) AS product_category_name -- Nome da categoria
      , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
      , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM product_category_raw
)

SELECT * FROM renamed;
