class WeatherController < ApplicationController
  def form
  end

  def display
	  response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_key']}/geolookup/conditions/q/LA/New_Orleans.xml")
	  @res = {
		  city: response['response']['location']['city'],
		  state: response['response']['location']['state'],
		  country: response['response']['location']['country'],
		  updated: response['response']['current_observation']['observation_time'],
		  weather: response['response']['current_observation']['weather'],
		  weather_icon: response['response']['current_observation']['icon_url'],
		  temp: response['response']['current_observation']['temp_f'],
		  wind: response['response']['current_observation']['wind_string'],
		  more_link: response['response']['current_observation']['forecast_url']
	  }
  end
end
