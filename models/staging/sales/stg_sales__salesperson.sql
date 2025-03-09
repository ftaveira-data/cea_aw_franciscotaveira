WITH salesperson_raw AS (
    SELECT *
    FROM {{ source('sales', 'SalesPerson') }}
),

    renamed AS (
    SELECT
         CAST(BusinessEntityID AS INT) AS pk_salesperson, -- pk do vendedor
         CAST(TerritoryID AS INT) AS fk_territory, -- FK para território de vendas
         COALESCE(CAST(SalesQuota AS FLOAT), 0) AS sales_quota, -- Meta de vendas do vendedor
         COALESCE(CAST(Bonus AS FLOAT), 0) AS bonus, -- Bônus recebido pelo vendedor
         CAST(CommissionPct AS FLOAT) AS commission_pct, -- Percentual de comissão do vendedor
         CAST(SalesYTD AS FLOAT) AS sales_ytd, -- Total de vendas do ano atual
         CAST(SalesLastYear AS FLOAT) AS sales_last_year -- Total de vendas do último ano
       --UPPER(CAST(RowGuid AS STRING)) AS id_unique -- Identificador único do registro
       --DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date -- Data de última modificação
    FROM salesperson_raw
)

SELECT * FROM renamed

