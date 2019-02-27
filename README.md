Sweater Weather
This app consumes APIs from Google GeoCode and DarkSky to render weather forecast data in json format for given locations and user favorited locations.

Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

From GitHub clone down repository using the following commands in terminal:

git clone git@github.com:jsmith23/sweater_weather.git
cd sweater_weather
Prerequisites
You will need Rails installed and verify that it is version 5.2

To check your version using terminal run: rails -v in the command line. If you have not installed rails, in terminal run: gem install rails -v 5.2 in the command line.

Installing
This app requires a few keys.

You can sign up for a Google API key here: https://cloud.google.com/maps-platform/

You can sign up for a Dark Sky API key here: https://darksky.net/dev/register

Open terminal and run these commands:

bundle

bundle update

figaro install

in your config/applicaion.yml file add your keys with these names:

GOOGLE_API_KEY:
DARK_SKY_API_KEY:
rails db:{create,migrate,seed}

