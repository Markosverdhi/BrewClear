## BrewClear
Welcome to BrewClear (name is tentative). This project is all about water chemistry as it applies to brewing good coffee. We want to give everyone as much info as they need about the local tap water in their home without muddying the water (get it?) with extra details that are too much.

### How does it work?
As of now, it doesn't. The idea is to have some frontend that a user will input their zip code in. The geocoder creates a boundary box and pulls the most recent water test results from that bbox, and then a grading script will grade how close it is to a given standard. Finally, a recommendation system will find out the best way, the easiest way and the cheapest way to increase the score of your water!

### To-Do
1. Currently there is no way to interact with the codebase. A frontend needs to be decided on, and implemented. Probably github pages will be the choice.
2. Currently, the only grading criteria used is SCA water standards. Implement a way to dynamically set water standards. Additionally, put some basic presets such as Scott Rao's recommendations, SCA recommendations, etc.
3. This project has been re-written in Julia, but the geocoder isn't working yet. Get the geocoder to work with Julia libraries instead of python ones.
