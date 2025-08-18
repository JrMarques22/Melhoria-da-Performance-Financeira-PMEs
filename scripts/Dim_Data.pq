let
    DataInicial = #date(2025, 1, 1),
    DataFinal = Date.EndOfMonth(Date.From(DateTime.LocalNow())),
    Dias = Duration.Days(DataFinal - DataInicial) + 1,
    ListaDatas = List.Dates(DataInicial, Dias, #duration(1,0,0,0)),
    Tabela = Table.FromList(ListaDatas, Splitter.SplitByNothing(), {"Data"}, null, ExtraValues.Error),

    AdAno = Table.AddColumn(Tabela, "Ano", each Date.Year([Data]), Int64.Type),
    AdMesNum = Table.AddColumn(AdAno, "MesNum", each Date.Month([Data]), Int64.Type),
    AdMes = Table.AddColumn(AdMesNum, "Mes", each Date.ToText([Data], "MMMM", "pt-BR"), type text),
    AdTrimestre = Table.AddColumn(AdMes, "Trimestre", each "T" & Number.ToText(Date.QuarterOfYear([Data])), type text),
    AdAnoMes = Table.AddColumn(AdTrimestre, "AnoMes", each Date.ToText([Data], "yyyy-MM"), type text),
    AdDiaSemanaNum = Table.AddColumn(AdAnoMes, "DiaSemanaNum", each Date.DayOfWeek([Data], Day.Monday) + 1, Int64.Type),
    AdDiaSemana = Table.AddColumn(AdDiaSemanaNum, "DiaSemana", each Date.ToText([Data], "dddd", "pt-BR"), type text),

    Tipos = Table.TransformColumnTypes(
        AdDiaSemana,
        {
            {"Data", type date},
            {"Ano", Int64.Type},
            {"MesNum", Int64.Type},
            {"Mes", type text},
            {"Trimestre", type text},
            {"AnoMes", type text},
            {"DiaSemanaNum", Int64.Type},
            {"DiaSemana", type text}
        }
    )
in
    Tipos
