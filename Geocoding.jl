using GMT

D = geocoder("Athens, Greece")
I = mosaic(D, bbox=true);
viz(I)