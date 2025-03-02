WITH sales_reason_raw AS ( 
    SELECT *
    FROM {{ source('sales', 'SalesOrderHeaderSalesReason') }}
)

, renamed AS (
    SELECT
         CAST(SalesOrderID AS INT) AS fk_sales_order  -- FK para a tabela SalesOrderHeader
       , CAST(SalesReasonID AS INT) AS fk_sales_reason  -- FK para a tabela SalesReason
       , DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date  -- Data de última modificação do registro
    FROM sales_reason_raw
)

SELECT * FROM renamed
