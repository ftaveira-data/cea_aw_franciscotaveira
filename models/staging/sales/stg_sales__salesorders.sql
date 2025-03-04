WITH sales_order_raw AS (
    SELECT *
    FROM {{ source('sales', 'SalesOrderHeader') }}
)

, renamed AS (
    SELECT
        CAST(SalesOrderID AS INT) AS pk_sales_order  -- Chave primária do pedido
      , CAST(RevisionNumber AS INT) AS revision_number  -- Número da revisão do pedido
      , CAST(OrderDate AS TIMESTAMP) AS order_date  -- Data do pedido
      , CAST(DueDate AS TIMESTAMP) AS due_date  -- Data de vencimento do pedido
      , CAST(ShipDate AS TIMESTAMP) AS ship_date  -- Data de envio do pedido
      , CAST(Status AS INT) AS order_status  -- Status do pedido
      , CAST(OnlineOrderFlag AS BOOLEAN) AS is_online_order  -- Indica se o pedido foi feito online
      , CAST(PurchaseOrderNumber AS STRING) AS purchase_order_number  -- Número do pedido de compra
      , CAST(AccountNumber AS STRING) AS account_number  -- Número da conta associada ao pedido
      , CAST(CustomerID AS INT) AS fk_customer  -- FK para a tabela Customer
      , CAST(SalesPersonID AS INT) AS fk_salesperson  -- FK para a tabela SalesPerson
      , CAST(TerritoryID AS INT) AS fk_territory  -- FK para a tabela SalesTerritory
      , CAST(BillToAddressID AS INT) AS fk_bill_address  -- FK para endereço de cobrança
      , CAST(ShipToAddressID AS INT) AS fk_ship_address  -- FK para endereço de entrega
      , CAST(ShipMethodID AS INT) AS fk_ship_method  -- FK para a tabela ShipMethod
      , CAST(CreditCardID AS INT) AS fk_credit_card  -- FK para a tabela CreditCard
      , CAST(CreditCardApprovalCode AS STRING) AS credit_card_approval_code  -- Código de aprovação do cartão de crédito
      , CAST(CurrencyRateID AS INT) AS fk_currency_rate  -- FK para a tabela CurrencyRate
      , CAST(SubTotal AS NUMERIC(18,2)) AS subtotal  -- Valor do subtotal (sem taxas)
      , CAST(TaxAmt AS NUMERIC(18,2)) AS tax_amount  -- Valor do imposto aplicado
      , CAST(Freight AS NUMERIC(18,2)) AS freight_cost  -- Custo do frete
      , CAST(TotalDue AS NUMERIC(18,2)) AS total_order_value  -- Valor total do pedido
      , CAST(Comment AS STRING) AS order_comment  -- Comentários adicionais sobre o pedido
      , UPPER(CAST(RowGuid AS STRING)) AS id_unique  -- Identificador único do pedido
      , DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date  -- Data de última modificação
    FROM sales_order_raw
)

SELECT * FROM renamed

