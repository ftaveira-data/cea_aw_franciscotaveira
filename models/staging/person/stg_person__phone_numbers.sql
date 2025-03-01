WITH person_phone_raw AS ( 
    SELECT *
    FROM {{ source('person', 'PersonPhone') }}  
)

, renamed AS (
    SELECT
       CAST(BusinessEntityID AS INT) AS fk_person -- Chave estrangeira referenciando a pessoa
     , CAST(PhoneNumber AS STRING) AS phone_number -- Número de telefone da pessoa
     , CAST(PhoneNumberTypeID AS INT) AS fk_phone_number_type -- Tipo do telefone (Ex: Celular, Comercial, Residencial)
     , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM person_phone_raw
)

SELECT * FROM renamed