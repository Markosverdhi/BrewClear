from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut

def geolocate(zip_code):
    geolocator = Nominatim(user_agent="app")
    miles_radius = 10
    miles_to_degrees = miles_radius/69
    try:
        location = geolocator.geocode({"postalcode":zip_code,})

        if location:
            lat,lon = location.latitude, location.longitude
            north = lat + miles_to_degrees
            south = lat - miles_to_degrees
            east = lon + miles_to_degrees
            west = lon - miles_to_degrees
            return north,south,east,west
        else:
            print("Location not found. Check your input.")
            return None
    except GeocoderTimedOut:
        print("oopsie daisy! The Geocoder service is broken! Try another million times, hopefully it fixes itself!")
        return None