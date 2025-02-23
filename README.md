# Certificação Analytics Engineer by Indicium

# 🚴 Adventure Works Analytics Project

## 📌 Sobre o Projeto

Este projeto faz parte da **Certificação em Engenharia de Analytics da Indicium** e tem como objetivo construir uma **plataforma moderna de dados** para a empresa **Adventure Works**, uma indústria de bicicletas. O foco principal é transformar a área de vendas, possibilitando decisões estratégicas baseadas em dados confiáveis.

O projeto segue o **Modern Analytics Stack**, utilizando ferramentas como **PostgreSQL, dbt, Snowflake** e uma ferramenta de BI para visualização.

## 🎯 Objetivos

- Construção de um **Data Warehouse** para centralizar os dados da empresa;
- Modelagem de **tabelas fato e dimensão** para responder às necessidades do negócio;
- Transformação de dados utilizando **dbt** com documentação e testes de qualidade;
- Desenvolvimento de **dashboards interativos** para análise de vendas;
- Garantia da **veracidade dos dados** (exemplo: validação de vendas de 2011);
- Criação de um vídeo explicativo sobre a implementação.

## 📊 Contexto de Negócio

A **Adventure Works** possui mais de **500 produtos**, **20.000 clientes** e **31.000 pedidos**, mas enfrenta dificuldades na integração de seus sistemas (**ERP, CRM e Web Analytics**), além de ceticismo interno sobre o retorno do investimento em dados.

O CEO, **Carlos Silveira**, vê a análise de dados como diferencial estratégico, enquanto a diretora comercial, **Silvana Teixeira**, questiona o impacto direto nas vendas. Para ganhar credibilidade, **dados confiáveis e bem estruturados são essenciais**.

## 📦 Arquitetura do Projeto

1. **Ingestão de Dados**: Coletamos informações do banco **PostgreSQL** e outras fontes.
2. **Transformação**: Utilizamos **dbt** para modelar tabelas de fatos e dimensões.
3. **Validação e Testes**: Implementamos **testes automatizados** para garantir a consistência dos dados.
4. **Visualização**: Criamos dashboards interativos no **Power BI ou Looker Studio**.
5. **Documentação**: Toda a modelagem e código estão devidamente documentados.
6. **Entrega Final**: Código hospedado no **GitHub** e vídeo explicativo gravado.

## 🛠 Tecnologias Utilizadas

- **dbt**: Modelagem de dados e criação do Data Warehouse.
- **Snowflake** : Armazenamento otimizado para análises.
- **Power BI**: Construção de dashboards interativos.
- **GitHub**: Controle de versão do projeto.
- **SQL**: Para consultas e scripts auxiliares.

## 📌 Modelagem de Dados

A modelagem segue o **modelo dimensional**, separando os dados em:

- **Tabelas Fato**:
  - `fato_pedidos`: Contém informações de pedidos, valores e quantidades vendidas.
  
- **Tabelas Dimensão**:
  - `dim_cliente`: Dados dos clientes.
  - `dim_produto`: Informações dos produtos.
  - `dim_vendedor`: Informações sobre os vendedores.
  - `dim_localidade`: Cidades, estados e países das vendas.
  - `dim_motivo_venda`: Razões associadas a cada pedido.

## 📈 Perguntas de Negócio Respondidas

Os dashboards fornecem insights como:

1. **Número total de pedidos**, produtos vendidos e valores negociados.
2. **Ranking de clientes** e produtos com maior ticket médio.
3. **Performance de vendas** por localização, tipo de pagamento e período.
4. **Comparação de desempenho comercial** entre cidades e estados.
5. **Tendências de vendas ao longo do tempo**.
6. **Impacto de promoções** nas vendas.

## 🔍 Validação de Dados

- O CEO solicitou uma **confirmação exata das vendas de 2011**: **USD 12.646.112,16**.
- Testes automatizados no dbt incluem:
  - Verificação de **chaves primárias** e integridade referencial.
  - Testes de consistência entre tabelas **fato e dimensão**.
  - Conferência de métricas como **ticket médio e número de pedidos**.

## 📑 Entregáveis

- 📄 **Diagrama conceitual** do Data Warehouse (**PDF**)
- 💾 **Código do projeto** disponível no **GitHub**
- 📊 **Dashboard interativo** no Power BI ou Looker Studio
- 🎥 **Vídeo explicativo** demonstrando todas as etapas do projeto

## 🚀 Como Executar o Projeto

1. **Clone o repositório**
   ```bash
   git clone https://github.com/ftaveira-data/cea_aw_franciscotaveira.git
