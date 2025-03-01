WITH product_inventory_raw AS (
    SELECT *
    FROM {{ source('production', 'ProductInventory') }}
)

, renamed AS (
    SELECT
        CAST(ProductID AS INT) AS fk_product -- Chave estrangeira para Produto
      , CAST(LocationID AS INT) AS fk_location -- Chave estrangeira para Localização
      , CAST(Shelf AS STRING) AS shelf -- Prateleira onde o produto está armazenado
      , CAST(Bin AS INT) AS bin -- Número do compartimento na prateleira
      , CAST(Quantity AS INT) AS quantity -- Quantidade disponível no estoque
      , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
      , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM product_inventory_raw
)

SELECT * FROM renamed
