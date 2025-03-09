WITH territory_raw AS (
    SELECT *
    FROM {{ source('sales', 'SalesTerritory') }}
)

, state_raw AS (
    SELECT *
    FROM {{ source('sales', 'StateProvince') }}
)

, renamed_territory AS (
    SELECT
        CAST(TERRITORYID AS INT) AS pk_territory,  -- ID do território
        CAST(NAME AS STRING) AS territory_name,  -- Nome do território
        CAST(COUNTRYREGIONCODE AS STRING) AS country_region,  -- Código do país
        CAST(GROUP AS STRING) AS territory_group,  -- Grupo do território (Ex: North America, Europe, etc.)
        CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date
    FROM territory_raw
)

, renamed_state AS (
    SELECT
        CAST(STATEPROVINCEID AS INT) AS pk_state,  -- ID do estado/província
        CAST(NAME AS STRING) AS state_name,  -- Nome do estado/província
        CAST(TERRITORYID AS INT) AS fk_territory,  -- Chave estrangeira para SalesTerritory
        CAST(COUNTRYREGIONCODE AS STRING) AS country_region,  -- Código do país
        CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date
    FROM state_raw
)

SELECT * FROM renamed_territory