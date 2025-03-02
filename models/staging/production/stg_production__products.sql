WITH product_raw AS (
    SELECT *
    FROM {{ source('production', 'Product') }}
)

, renamed AS (
    SELECT
        CAST(ProductID AS INT) AS pk_product -- Chave primária do produto
      , CAST(Name AS STRING) AS product_name -- Nome do produto
      , CAST(ProductNumber AS STRING) AS product_number -- Código do produto
      , CAST(MakeFlag AS BOOLEAN) AS is_manufactured -- Indica se o produto é fabricado internamente
      , CAST(FinishedGoodsFlag AS BOOLEAN) AS is_finished_good -- Indica se é um produto acabado
      , CAST(Color AS STRING) AS color -- Cor do produto
      , CAST(SafetyStockLevel AS INT) AS safety_stock_level -- Nível de estoque seguro
      , CAST(ReorderPoint AS INT) AS reorder_point -- Ponto de reabastecimento
      , CAST(StandardCost AS FLOAT) AS standard_cost -- Custo padrão do produto
      , CAST(ListPrice AS FLOAT) AS list_price -- Preço de venda sugerido
      , CAST(Size AS STRING) AS size -- Tamanho do produto
      , CAST(SizeUnitMeasureCode AS STRING) AS size_unit_measure -- Código da unidade de medida do tamanho
      , CAST(WeightUnitMeasureCode AS STRING) AS weight_unit_measure -- Código da unidade de medida do peso
      , CAST(Weight AS FLOAT) AS weight -- Peso do produto
      , CAST(DaysToManufacture AS INT) AS days_to_manufacture -- Dias necessários para fabricação
      , CAST(ProductLine AS STRING) AS product_line -- Linha de produto
      , CAST(Class AS STRING) AS product_class -- Classe do produto
      , CAST(Style AS STRING) AS product_style -- Estilo do produto
      , CAST(ProductSubcategoryID AS INT) AS fk_product_subcategory -- Chave estrangeira para subcategoria do produto
      , CAST(ProductModelID AS INT) AS fk_product_model -- Chave estrangeira para modelo do produto
      , CAST(SellStartDate AS TIMESTAMP) AS sell_start_date -- Data de início das vendas
      , CAST(SellEndDate AS TIMESTAMP) AS sell_end_date -- Data de fim das vendas (se aplicável)
      , CAST(DiscontinuedDate AS TIMESTAMP) AS discontinued_date -- Data de descontinuação (se aplicável)
      , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
      , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM product_raw
)

SELECT * FROM renamed
