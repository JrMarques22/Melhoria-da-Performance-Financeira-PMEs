let
    Fonte = Csv.Document(
        File.Contents(pRoot & "/data/dim_cliente.csv"),
        [Delimiter = ",", Columns = 4, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    Promovidas = Table.PromoteHeaders(Fonte, [PromoteAllScalars = true]),
    Tipos = Table.TransformColumnTypes(
        Promovidas,
        {
            {"ClienteID", Int64.Type},
            {"NomeCliente", type text},
            {"Segmento", type text},
            {"Regiao", type text}
        }
    )
in
    Tipos
