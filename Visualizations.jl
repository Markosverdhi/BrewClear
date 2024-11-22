using CSV, DataFrames, Plots, Statistics


PATH_TO_DATA = "StateCollegeTestData.csv"
# Load the data
df = CSV.File(PATH_TO_DATA) |> DataFrame

# Example 1: Plot ResultMeasureValue over Time
# We'll group the data by ActivityStartDate and plot average ResultMeasureValue over time.

# Processing pipeline
df |> 
    x -> groupby(x, :ActivityStartDate) |>  # Group by start date
    x -> combine(x, :ResultMeasureValue => mean => :AvgResultMeasureValue) |>  # Compute average measure per date
    x -> sort(x, :ActivityStartDate) |>  # Sort by date
    x -> plot(x.ActivityStartDate, x.AvgResultMeasureValue, 
              title = "Average Result Measure Value Over Time",
              xlabel = "Date",
              ylabel = "Average Result Measure Value",
              legend = false,
              xrotation = 45)

# Example 2: Bar plot of CharacteristicName vs Average ResultMeasureValue
# Shows the average measurement value per characteristic type

df |>
    x -> groupby(x, :CharacteristicName) |>
    x -> combine(x, :ResultMeasureValue => mean => :AvgResultMeasureValue) |>
    x -> sort(x, :AvgResultMeasureValue, rev=true) |>  # Sort by average value descending
    x -> bar(x.CharacteristicName, x.AvgResultMeasureValue,
             title = "Average Result Measure Value by Characteristic",
             xlabel = "Characteristic Name",
             ylabel = "Average Result Measure Value",
             xticks = :auto,  # Automatically adjust x-ticks for readability
             legend = false,
             xrotation = 45)