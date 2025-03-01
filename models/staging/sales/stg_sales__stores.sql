WITH store_raw AS (
    SELECT *
    FROM {{ source('sales', 'Store') }}
)

, renamed AS (
    SELECT
        CAST(BUSINESSENTITYID AS INT) AS pk_store  -- ID único da loja (PK)
      , CAST(NAME AS STRING) AS store_name  -- Nome da loja
      , CAST(SALESPERSONID AS INT) AS fk_salesperson  -- ID do vendedor responsável (FK para SalesPerson)
      , CAST(DEMOGRAPHICS AS STRING) AS demographics  -- Dados demográficos da loja
      , UPPER(CAST(ROWGUID AS STRING)) AS id_unique  -- ID único
      , CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date  -- Data da última modificação
    FROM store_raw
)

SELECT * FROM renamed
