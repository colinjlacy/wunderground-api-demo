class WeatherController < ApplicationController
  def form
  end

  def display
	  response = HTTParty.get("http://api.wunderground.com/api/#{ENV['wunderground_key']}/geolookup/conditions/q/LA/New_Orleans.json");
	  @res = response.to_s
  end
end
