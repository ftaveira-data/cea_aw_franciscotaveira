WITH state_province_raw AS ( 
    SELECT *
    FROM {{ source('person', 'StateProvince') }}  
)

, renamed AS (
    SELECT
       CAST(StateProvinceID AS INT) AS pk_state_province -- Chave primária do estado/província
     , CAST(StateProvinceCode AS STRING) AS state_province_code -- Código do estado/província
     , CAST(CountryRegionCode AS STRING) AS fk_country_region -- Chave estrangeira para o país/região
     , CAST(IsOnlyStateProvinceFlag AS BOOLEAN) AS is_only_state_province -- Indica se é a única subdivisão da região
     , CAST(Name AS STRING) AS state_province_name -- Nome do estado/província
     , CAST(TerritoryID AS INT) AS fk_territory -- Chave estrangeira para território de vendas
     , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
     , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM state_province_raw
)

SELECT * FROM renamed
