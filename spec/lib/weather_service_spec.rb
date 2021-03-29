# frozen_string_literal: true

require 'rails_helper'
# require 'spec_helper'

describe WeatherService do
  describe 'get weather' do
    context 'valid zipcode' do
      let(:weather_data) { WeatherService.call('33071') }
      it 'returns the weather based on zipcode' do
        VCR.use_cassette('weatherservice') do
          response = weather_data
          expect(response).to be_success
        end
        expect(weather_data['name']).to eq('Pompano Beach')
        expect(weather_data['weather'][0]['description']).to eq('clear sky')
        expect(weather_data['cod']).to eq(200)
        expect { weather_data }.to_not raise_error
      end
    end

    context 'invalid zipcode' do
      let(:weather_data) { WeatherService.call('3371') }
      it 'throws an error ' do
        expect { weather_data }.to raise_error
      end
    end
  end
end
