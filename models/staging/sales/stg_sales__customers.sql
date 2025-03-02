WITH customers_raw AS ( 
    SELECT *
    FROM {{ source('sales', 'Customer') }}  
)

, renamed AS (
    SELECT
       CAST(CustomerID AS INT) AS pk_customer  -- Chave primária do cliente
     , CAST(PersonID AS INT) AS fk_person  -- FK para a tabela Person
     , CAST(StoreID AS INT) AS fk_store  -- FK para a loja associada ao cliente
     , CAST(TerritoryID AS INT) AS fk_territory  -- FK para o território de vendas
     , CAST(ROWGUID AS STRING) AS id_unique  -- Identificador único do registro
     , DATE_TRUNC('DAY', CAST(MODIFIEDDATE AS TIMESTAMP)) AS modified_date  -- Data de última modificação
    FROM customers_raw
)

SELECT * FROM renamed


