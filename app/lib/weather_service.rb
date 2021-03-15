# frozen_string_literal: true

# Action plan:
# get user_zipcode from db
# user zipcode to hit api.openweathermap.org/data/2.5/weather?zip={zipcode},us&appid=WEATHER_API_KEY
# Error handling
# spec
# ship it
class WeatherService
  class WeatherServiceError < StandardErorr
  end
  attr_reader :zipcode
  def intialize(zipcode)
    @zipcode = zipcode
  end

  def self.call(zipcode)
    my_location = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&appid=#{ENV['WEATHER_API_KEY']}")
    my_location
  end

private
 def check_zipcode(zipcode)
  zipcode.length= 5 && zipcode.to_i.to_s == zipcode
 end
 
end
