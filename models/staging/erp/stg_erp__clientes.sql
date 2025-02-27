WITH 
    clientes_raw AS ( 
        SELECT *
        FROM {{ source('erp', 'Customer') }}
)
, renomeado AS (
    SELECT
        CAST(CUSTOMERID AS INT) AS id_cliente
        , CAST(PERSONID AS INT) AS id_pessoa
        , CAST(STOREID AS INT) AS id_loja
        , CAST(TERRITORYID AS INT) AS id_territorio
        , CAST(ROWGUID AS STRING) AS id_unico
        , CAST(MODIFIEDDATE AS TIMESTAMP) AS data_modificacao
    FROM clientes_raw
)

SELECT * FROM renomeado
