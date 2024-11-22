using CSV
using DataFrames

df = CSV.File("StateCollegeTestData.csv") |> DataFrame 

df |>
    x -> filter(row -> row.CharacteristicName == "Total dissolved solids", x) |>
    x -> select(x, :ResultMeasureValue, :ActivityStartDate) |>
    x -> sort(x, :ActivityStartDate) |>
    x -> begin 
        scatter(x.ActivityStartDate, x.ResultMeasureValue,
            xlabel = "Date",
            ylabel = "TDS", 
            title = "State College TDS over time",
            legend = false)
        hline!([150], color = :green, linewidth = 2)
        hline!([75,250], color = :red, linewidth = 1)
    end

