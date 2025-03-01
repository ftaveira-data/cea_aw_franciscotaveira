WITH address_raw AS (
    SELECT *
    FROM {{ source('person', 'Address') }}
)

, renamed AS (
    SELECT
        CAST(AddressID AS INT) AS pk_address  -- Chave primária do endereço
      , CAST(AddressLine1 AS STRING) AS address_line1  -- Primeira linha do endereço
      , CAST(AddressLine2 AS STRING) AS address_line2  -- Segunda linha do endereço (opcional)
      , CAST(City AS STRING) AS city  -- Cidade do endereço
      , CAST(StateProvinceID AS INT) AS fk_state_province  -- FK para a tabela StateProvince
      , CAST(PostalCode AS STRING) AS postal_code  -- Código postal do endereço
      , CAST(SpatialLocation AS STRING) AS spatial_location  -- Dados espaciais do endereço
      , UPPER(CAST(RowGuid AS STRING)) AS id_unique  -- Identificador único do registro
      , DATE_TRUNC('DAY', CAST(ModifiedDate AS TIMESTAMP)) AS modified_date  -- Data de última modificação
    FROM address_raw
)

SELECT * FROM renamed
