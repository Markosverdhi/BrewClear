using HTTP, JSON3, DataFrames

function fetch_data(zip_code)
    n, s, e, w = geolocate(zip_code) #Geocoding.jl needs to be fixed for this to work
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

    response = HTTP.get(url, query = params)

    if response.status == 200
        data = JSON3.read(response.body)
        features = data["features"]
        println("Fetched $(length(features)) sites within 10 miles of zip code.")

        df = DataFrame(JSON3.read(JSON3.write(features)))
        
        println("\nJSON Format:")
        println(JSON3.write(df))
        
    else
        println("Error fetching data: $(response.status)")
    end
end

fetch_data("16801")
