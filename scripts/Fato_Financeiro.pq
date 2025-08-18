let
    Fonte = Csv.Document(
        File.Contents(pRoot & "/data/fato_financeiro.csv"),
        [Delimiter = ",", Columns = 7, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Promovidas = Table.PromoteHeaders(Fonte, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(
        Promovidas,
        {
            {"ID_Transacao", Int64.Type},
            {"Data", type date},
            {"Tipo", type text},
            {"Conta_Contabil", type text},
            {"ClienteID", Int64.Type},
            {"ProdutoID", Int64.Type},
            {"Valor", type number}
        }
    )
in
    Tipos
