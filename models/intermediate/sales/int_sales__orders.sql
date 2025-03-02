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
        
        -- Datas do pedido
        h.order_date,
        h.due_date,
        h.ship_date,

        -- Status do pedido
        h.order_status,
        h.is_online_order,

        -- Identificadores de relacionamento
        h.fk_customer,
        h.fk_salesperson,
        h.fk_territory,
        h.fk_ship_method,
        h.fk_creditcard,
        
        -- Dados do pedido
        d.fk_product,
        d.order_qty,
        d.unit_price,
        d.line_total,

        -- Cálculo do valor total do pedido
        h.total_due AS total_order_value,
        
        -- Identificadores únicos e metadata
        h.id_unique,
        h.modified_date
        
    FROM sales_orders h
    LEFT JOIN sales_orders_details d
        ON h.pk_salesorder = d.fk_salesorder
)

SELECT * FROM joined_orders
