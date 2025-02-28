WITH customers_raw AS ( 
    SELECT *
    FROM {{ source('sales', 'Customer') }}  
)

, renamed AS (
    SELECT
         CAST(CustomerID AS INT) AS pk_customer
     ,   CAST(PersonID AS INT) AS fk_person
     ,   CAST(StoreID AS INT) AS fk_store
     ,   CAST(TerritoryID AS INT) AS fk_territory
     ,   CAST(ROWGUID AS STRING) AS id_unique
     ,   CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date
    FROM customers_raw
)

SELECT * FROM renamed

