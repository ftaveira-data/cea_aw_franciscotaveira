# 🎓 Certificação Analytics Engineer by Indicium

# 🚴 Projeto Adventure Works Analytics

## 📌 Sobre o Projeto

Este repositório é parte do desafio da **Certificação em Engenharia de Analytics da Indicium**, com foco na construção de uma **plataforma moderna de dados** para a empresa fictícia **Adventure Works**, uma indústria de bicicletas.

O projeto segue o conceito de **Modern Analytics Stack**, utilizando **Snowflake, dbt, Power BI e GitHub**, com foco principal em transformar dados brutos de vendas em insights acionáveis e confiáveis.

---

## 🎯 Objetivos do Projeto

- Construir um **Data Warehouse** baseado em modelo dimensional (Star Schema);
- Modelar **tabelas fato e dimensão** para análise de vendas;
- Criar transformações com **dbt**, incluindo documentação e testes automatizados;
- Desenvolver **dashboard interativo** no Power BI;
- Responder perguntas críticas do negócio, como top produtos, regiões e motivos de compra;
- Garantir a **veracidade dos dados**, incluindo validação de valores específicos (ex: vendas de 2011);
- Documentar todo o processo e apresentar em vídeo.

---

## 🧱 Arquitetura da Solução

1. **Ingestão de Dados**: Dados carregados em Snowflake em uma estrutura bruta (`raw`).
2. **Transformação**: Utilização de **dbt** para criar camadas `staging`, `intermediate` e `marts`.
3. **Modelagem Dimensional**: Aplicação de Star Schema com tabelas fato e dimensões.
4. **Visualização**: Criação de dashboard no **Power BI Desktop**, entregue via `.pbix`.
5. **Entrega Final**: Código hospedado no **GitHub**, com documentação e vídeo explicativo.

---

## 🛠️ Tecnologias Utilizadas

- **Snowflake** → Data warehouse em nuvem
- **dbt (Data Build Tool)** → Modelagem e transformação de dados
- **Power BI Desktop** → Visualização dos dados e construção do dashboard
- **GitHub** → Versionamento do projeto e entrega
- **SQL** → Linguagem principal para modelagem analítica

---

## 🧩 Modelagem Dimensional

### Fato:
- `fact_sales`: vendas consolidadas com métricas como quantidade, valor bruto, desconto, valor líquido (lucro), ticket médio etc.

### Dimensões:
- `dm_product`: produtos e categorias
- `dm_customer`: clientes e seus dados de localização
- `dm_store`: lojas
- `dm_salesperson`: vendedores
- `dm_salesreason`: motivos de venda
- `bridge_salesreason`: tabela ponte para relacionamento N:N

---

## 📊 Análises e Perguntas Respondidas

Os dashboards permitem responder com clareza:

1. Vendas por produto, cliente e motivo de venda (item 4a)
2. Produtos com maior ticket médio por local e período (item 4b)
3. Top 10 clientes por valor negociado (item 4c)
4. Top 5 cidades com maior valor de venda (item 4d)
5. Evolução temporal de vendas (item 4e)
6. Produto mais vendido com motivo de venda “Promotion” (item 4f)

---

## 📈 Visualizações Criadas no Dashboard

- Página 1: Visão Geral
  - KPIs principais
  - Gráfico de evolução mensal
  - Vendas por estado
- Página 2: Análise de Produtos
  - Top produtos vendidos
  - Ticket médio por produto
  - Vendas com motivo “Promotion”
- Página 3: Análise de Clientes
  - Top clientes
  - Média de pedidos por cliente
  - Mapa de vendas por região

---

## ✅ Validação de Dados

- O CEO requisitou validação das vendas de 2011: **USD 12.646.112,16**
- Utilizamos testes do dbt:
  - **not_null**
  - **unique**
  - **relationship**
  - Validação de métricas como ticket médio, desconto e quantidade de pedidos

---

## 📁 Estrutura do Repositório

```bash
📦 adventureworks-certificacao/
├── dbt/
│   └── models/
│       ├── staging/
│       ├── intermediate/
│       └── marts/
├── dashboard/
│   └── adventureworks_dashboard.pbix
├── DOCUMENTACAO.md
├── README.md