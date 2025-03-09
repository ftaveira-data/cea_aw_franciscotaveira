WITH person_raw AS ( 
    SELECT *
    FROM {{ source('person', 'Person') }}  
)

, renamed AS (
    SELECT
       CAST(BusinessEntityID AS INT) AS pk_person, -- Chave primária da pessoa
       CAST(PersonType AS STRING) AS person_type, -- Tipo da pessoa (Ex: Funcionário, Cliente)
     --CAST(NameStyle AS BOOLEAN) AS name_style -- Indica o formato do nome (True/False)
     --CAST(Title AS STRING) AS title -- Título de cortesia (Ex: Sr., Sra., Dr.)
       CAST(FirstName AS STRING) AS first_name, -- Primeiro nome da pessoa
       CAST(MiddleName AS STRING) AS middle_name, -- Nome do meio (pode ser NULL)
       CAST(LastName AS STRING) AS last_name, -- Sobrenome da pessoa
     --CAST(Suffix AS STRING) AS suffix -- Sufixo do nome (Ex: Jr., III)
     --CAST(EmailPromotion AS INT) AS email_promotion -- Indica se recebe promoções por e-mail
     --CAST(AdditionalContactInfo AS STRING) AS additional_contact_info -- Informações adicionais de contato
       CAST(Demographics AS STRING) AS demographics -- Dados demográficos
     --CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
     --CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM person_raw
)

SELECT * FROM renamed
