WITH salespersons AS (
    SELECT *
    FROM {{ ref('stg_sales__salesperson') }}
)

, stores AS (
    SELECT 
        pk_store, 
        store_name, 
        fk_salesperson
    FROM {{ ref('stg_sales__stores') }}
)

, enriched_salespersons AS (
    SELECT 
        sp.pk_salesperson,
        sp.fk_territory,
        sp.commission_pct,
        COALESCE(s.store_name, 'Independent') AS associated_store, 
        sp.modified_date
    FROM salespersons sp
    LEFT JOIN stores s ON sp.pk_salesperson = s.fk_salesperson
)

SELECT * FROM enriched_salespersons

