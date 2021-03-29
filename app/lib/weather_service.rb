# frozen_string_literal: true

class WeatherService
  class WeatherServiceError < StandardError; end

  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def self.call(zipcode)
    new(zipcode).call
  end

  def call
    WeatherServiceError.new('Wrong value') unless valid_zipcode?(zipcode)

    my_location = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&appid=#{ENV['WEATHER_API_KEY']}")
    my_location
  end

  private

  def valid_zipcode?(zipcode)
    !!(zipcode =~ /\A\d{5}-\d{4}|\A\d{5}\z/)
  end
end
