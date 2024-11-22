using HTTP, JSON3, DataFrames

function geolocate(zip_code)
    # Replace with actual geolocation logic if needed
    return (40.8, 40.7, -77.8, -77.9)  # Example coordinates
end

# Function to fetch data
function fetch_data(zip_code)
    n, s, e, w = geolocate(zip_code)
    url = "https://www.waterqualitydata.us/ogcservices/wfs/"
    params = Dict(
        "request" => "GetFeature",
        "service" => "wfs",
        "version" => "2.0.0",
        "typeNames" => "wqp_sites",
        "SEARCHPARAMS" => "providers:NWIS|STORET",
        "bbox" => "$n,$s,$e,$w",
        "outputFormat" => "application/json"
    )

    # Make the request
    response = HTTP.get(url, query = params)

    # Check if the response was successful
    if response.status == 200
        data = JSON3.read(response.body)
        features = data["features"]
        println("Fetched $(length(features)) sites within 10 miles of zip code.")

        # Convert the JSON data to a DataFrame
        df = DataFrame(JSON3.read(JSON3.write(features)))
        
        # Print as CSV
        println("CSV Format:")
        println(IOBuffer() |> (io -> CSV.write(io, df; delim=',') |> String))

        # Print as JSON
        println("\nJSON Format:")
        println(JSON3.write(df))
        
    else
        println("Error fetching data: $(response.status)")
    end
end

# Fetch data for a specific zip code
fetch_data("16801")