WITH country_region_raw AS ( 
    SELECT *
    FROM {{ source('person', 'CountryRegion') }}  
)

, renamed AS (
    SELECT
       CAST(CountryRegionCode AS STRING) AS pk_country_region -- Código do país/região (PK)
     , CAST(Name AS STRING) AS country_region_name -- Nome do país/região
     , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM country_region_raw
)

SELECT * FROM renamed
