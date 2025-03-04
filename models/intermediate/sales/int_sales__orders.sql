WITH sales_orders AS (
    SELECT * FROM {{ ref('stg_sales__salesorders') }}
),
sales_orders_details AS (
    SELECT * FROM {{ ref('stg_sales__orders_details') }}
)
, joined_orders AS (
    SELECT 
        -- Chave primária do pedido
        h.pk_sales_order, 
        
        -- Informações do pedido
        h.revision_number, 
        h.order_date,
        h.due_date,
        h.ship_date,

        -- Status e tipo do pedido
        h.order_status,
        h.is_online_order,

        -- Dados financeiros e identificadores
        h.purchase_order_number,
        h.account_number,

        -- Identificadores de relacionamento
        h.fk_customer,
        h.fk_salesperson,
        h.fk_territory,
        h.fk_bill_address,  
        h.fk_ship_address,  
        h.fk_ship_method,
        h.fk_credit_card,
        h.credit_card_approval_code,
        h.fk_currency_rate,

        -- Dados do pedido
        d.pk_sales_order_detail, -- ID do detalhe do pedido
        d.tracking_number,       -- Número de rastreamento
        d.quantity_ordered,      -- Quantidade comprada
        d.fk_product,            -- Produto relacionado
        d.fk_special_offer,      -- Oferta especial aplicada
        d.unit_price,            -- Preço unitário do produto
        d.unit_price_discount,   -- Desconto aplicado

        -- Valores financeiros
        COALESCE(h.subtotal, 0) AS subtotal,
        COALESCE(h.tax_amount, 0) AS tax_amount,
        COALESCE(h.freight_cost, 0) AS freight_cost,
        h.total_order_value AS total_order_value,

        -- Comentários do pedido
        h.order_comment,

        -- Identificadores únicos e metadata
        h.id_unique,
        h.modified_date
        
    FROM sales_orders h
    LEFT JOIN sales_orders_details d
        ON h.pk_sales_order = d.fk_sales_order
)

SELECT * FROM joined_orders
