WITH sales_order_details_raw AS (
    SELECT *
    FROM {{ source('sales', 'SalesOrderDetail') }}
)

, renamed AS (
    SELECT
        CAST(SalesOrderID AS INT) AS fk_sales_order -- FK para SalesOrderHeader
      , CAST(SalesOrderDetailID AS INT) AS pk_sales_order_detail -- Chave primária
      , CAST(CarrierTrackingNumber AS STRING) AS tracking_number -- Código de rastreamento
      , CAST(OrderQty AS INT) AS quantity_ordered -- Quantidade pedida
      , CAST(ProductID AS INT) AS fk_product -- FK para Product
      , CAST(SpecialOfferID AS INT) AS fk_special_offer -- FK para oferta especial
      , CAST(UnitPrice AS FLOAT) AS unit_price -- Preço unitário
      , CAST(UnitPriceDiscount AS FLOAT) AS unit_price_discount -- Desconto aplicado
      , UPPER(CAST(ROWGUID AS STRING)) AS id_unique -- GUID de referência
      , DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date -- Última modificação
    FROM sales_order_details_raw
)

SELECT * FROM renamed
