# Melhoria-da-Performance-Financeira-PMEs
Análise de indicadores para melhoria da performance financeira no Power BI

# PME Finance Performance (Power BI)

Projeto de análise de indicadores financeiros para PMEs no Power BI, com modelo estrela, KPIs (receita, margem, lucro, fluxo de caixa, endividamento) e comparações temporais (MTD/YTD/YoY).

## Como usar (Power BI Desktop)
1. Clone este repositório.
2. Abra o Power BI Desktop.
3. Crie **um parâmetro de texto** chamado `pRoot` com o caminho local da pasta do repo (ex.: `C:\Users\seu.usuario\Documents\pme-finance-performance`).
4. Para cada tabela, vá em **Power Query** > **Exibir** > **Editor Avançado** e cole o conteúdo `.pq` correspondente de `scripts/powerquery/`.
5. Carregue as tabelas.
6. Marque `Dim_Data` como **Tabela de datas** (Modelagem > Marcar como tabela de datas > selecionar coluna `Data`).
7. No **Modelo**, verifique/ajuste relacionamentos:
   - `Fato_Financeiro[Data]` → `Dim_Data[Data]` (um-para-muitos, single)
   - `Fato_Financeiro[ClienteID]` → `Dim_Cliente[ClienteID]`
   - `Fato_Financeiro[ProdutoID]` → `Dim_Produto[ProdutoID]`
   - (Opcional) `Fato_Financeiro[Conta_Contabil]` → `Dim_Conta[NomeConta]`
8. Crie uma tabela de medidas (Modelagem > Nova tabela > digite `TabelaMedidas = DATATABLE("x", STRING, {{"_"}})`).
9. Importe as medidas copiando de `scripts/dax/medidas_financeiras.dax` (cole em medidas na `TabelaMedidas`).
10. Monte os visuais:
    - Cards: Receita Total, Lucro Líquido, Margem Líquida %, Fluxo Caixa Operacional, Endividamento
    - Linha: Receita x Custo x Lucro (por mês)
    - Barras: Margem por Produto/Categoria
    - Pareto Clientes (Receita)
    - Waterfall: Fluxo de Caixa mês a mês
11. Salve como `.pbix` ou como **Power BI Project (.pbip)** para versionar melhor.

## Observações
- **Power Query (M)** é usado para ingestão/limpeza (Editor Avançado, tipos, `List.Dates`, `Table.TransformColumnTypes`).
- **DAX** é usado para medidas dinâmicas e time intelligence (DATEADD, TOTALYTD etc.).  
- Garanta que a `Dim_Data` esteja correta e marcada para os cálculos de tempo funcionarem.

## Licença
MIT (ver LICENSE).
