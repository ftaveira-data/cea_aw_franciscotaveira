WITH salesperson_raw AS (
    SELECT *
    FROM {{ source('sales', 'SalesPerson') }}
)

, renamed AS (
    SELECT
        CAST(BusinessEntityID AS INT) AS pk_salesperson
      ,  CAST(TerritoryID AS INT) AS fk_territory
      ,  COALESCE(CAST(SalesQuota AS FLOAT), 0) AS sales_quota
      ,  COALESCE(CAST(Bonus AS FLOAT), 0) AS bonus
      ,  CAST(CommissionPct AS FLOAT) AS commission_pct
      ,  CAST(SalesYTD AS FLOAT) AS sales_ytd
      ,  CAST(SalesLastYear AS FLOAT) AS sales_last_year
      ,  UPPER(CAST(RowGuid AS STRING)) AS id_unique
      ,  DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date  
    FROM salesperson_raw
)

SELECT * FROM renamed
