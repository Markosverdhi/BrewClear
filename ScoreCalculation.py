import inspect
import typing
import numpy as np

#variables are in order ["tds", "calcium", "alkalinity", "sodium", "ph", "chlorine"]

targets = np.array([150,68,40,10,7.0,0]) #To-Do: implement a way to get the most up-to-date recommendations

#acceptable_ranges = [(75, 250),(17, 85),(35, 45),(5, 15),(6.5, 7.5),(0,0)]

# calculate_score: a function that returns a score from 0 to 100 based on how close the input values are to the target values.
def calculate_score(values:list, sd:list) -> int:
    k = 2 # sensitivity constant - higher is more sensitive to errors. 0<k<1 means less sensitive than baseline.
    values_array = np.array(values)
    sd_array = np.array(sd)
    r_values = values_array - targets
    normalized_r = np.sum(np.abs(r_values/sd_array))
    S = 100 - abs(k * normalized_r)
    return max(0,S)

test_list = [110,68,40,10,7.0,0]