let
    Fonte = Csv.Document(
        File.Contents(pRoot & "/data/dim_conta.csv"),
        [Delimiter = ",", Columns = 3, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Promovidas = Table.PromoteHeaders(Fonte, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(
        Promovidas,
        {
            {"ContaID", Int64.Type},
            {"NomeConta", type text},
            {"Tipo", type text}
        }
    )
in
    Tipos
