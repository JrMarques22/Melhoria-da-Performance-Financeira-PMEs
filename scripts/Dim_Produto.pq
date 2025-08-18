let
    Fonte = Csv.Document(
        File.Contents(pRoot & "/data/dim_produto.csv"),
        [Delimiter = ",", Columns = 5, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Promovidas = Table.PromoteHeaders(Fonte, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(
        Promovidas,
        {
            {"ProdutoID", Int64.Type},
            {"NomeProduto", type text},
            {"Categoria", type text},
            {"CustoUnitario", type number},
            {"PrecoUnitario", type number}
        }
    )
in
    Tipos
