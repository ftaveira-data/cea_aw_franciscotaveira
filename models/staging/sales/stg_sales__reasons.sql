WITH sales_reason_raw AS(
    SELECT *
    FROM {{ source('sales', 'SalesReason') }}
),
    renamed AS (
    SELECT
         CAST (SALESREASONID as INT) as  pk_sales_reason, -- Chave primária da razão da compra
         CAST (NAME as STRING) as reason_name,  -- Nome do motivo da venda
         CAST (REASONTYPE as STRING) as reason_type  -- Tipo do motivo (ex: Promoção, Marketing)
      -- DATE_TRUNC('DAY', CAST (MODIFIEDDATE as TIMESTAMP)) as  modified_date -- Data da última modificação do registro
       FROM sales_reason_raw
) 
SELECT * FROM renamed
