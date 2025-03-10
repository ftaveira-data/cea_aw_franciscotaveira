WITH territories_raw AS (
    SELECT * 
    FROM {{ source('sales', 'SalesTerritory') }}
),

renamed AS (
    SELECT 
         CAST(TerritoryID AS INT) AS pk_territory
       , CAST(Name AS STRING) AS territory_name
       , CAST(CountryRegionCode AS STRING) AS fk_country_region
       , CAST(SalesYTD AS FLOAT) AS sales_ytd
       , CAST(SalesLastYear AS FLOAT) AS sales_last_year 
    FROM territories_raw
)

SELECT * FROM renamed


