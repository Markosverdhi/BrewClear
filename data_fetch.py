import requests
from geocoding import geolocate
import numpy as np
import pandas as pd

def fetch_data(zip_code):

    n,s,e,w = geolocate(zip_code)
    url = "https://www.waterqualitydata.us/ogcservices/wfs/"
    params = {
        "request": "GetFeature",
        "service": "wfs",
        "version": "2.0.0",
        "typeNames": "wqp_sites",
        "SEARCHPARAMS": "providers:NWIS|STORET",
        "bbox": f"{n},{s},{e},{w}",
        "outputFormat": "application/json"
    }

    # Make the request
    response = requests.get(url, params=params)

    # Check if the response was successful
    if response.status_code == 200:
        data = response.json()
        print(f"Fetched {len(data['features'])} sites within 10 miles of zip code.")
        return data["features"]
    else:
        print(f"Error fetching data: {response.status_code}")
        return []


fetch_data("16801")
