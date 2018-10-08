# frozen_string_literal: true

class Condition < ApplicationRecord
  belongs_to :spot

  BASE_URL = 'http://api.worldweatheronline.com/premium/v1/marine.ashx?'
  SECONDARY_URL = '&format=json&tide=yes&tp=1&'
  API_PARTIAL = "key=#{Rails.application.credentials.wwo[:WWO_KEY]}"
  SC = "q=#{Rails.application.credentials.wwo[:SC]}"
  WB_NE = "q=#{Rails.application.credentials.wwo[:WB_NE]}"
  WB_SE = "q=#{Rails.application.credentials.wwo[:WB_SE]}"
  CB = "q=#{Rails.application.credentials.wwo[:CB]}"

  def self.weather(short_code)
    @request = HTTParty.get(BASE_URL + API_PARTIAL + SECONDARY_URL + short_code).parsed_response
    @date_string = Time.zone.today.to_s
    @hour_string = (Time.zone.now.hour * 100).to_s
    @weather_data = @request.dig('data', 'weather')
    @today_weather = @weather_data.select { |key, _value| key['date'] == @date_string }.first
    @hour_weather = @today_weather.dig('hourly').select { |key, _value| key['time'] == @hour_string }.first
    @tides = @today_weather.dig('tides')
    @tide_data = @tides.first['tide_data']
  end

  def self.get_tide
    @time_difference = nil
    @tide_data.each do |data|
      current_difference = (Time.zone.now - data['tideDateTime'].to_time).abs
      if @time_difference
        if current_difference < @time_difference
          @time_difference = current_difference
          @closest_tide = data
        end
      else
        @closest_tide = data
        @time_difference = current_difference
      end
    end
    @closest_tide
    @tide_type = @closest_tide.dig('tide_type')
    @tide_time = @closest_tide.dig('tideTime')
  end

  def self.condition(short_code)
    spot = Spot.find_by(code: short_code)
    id = spot.id
    condition = Condition.find(id)
    condition.attributes = {
      swell_period_s: @hour_weather['swellPeriod_secs'],
      swell_height_ft: @hour_weather['swellHeight_ft'],
      swell_direction: @hour_weather['swellDir16Point'],
      wind_speed_mph: @hour_weather['windspeedMiles'],
      wind_direction: @hour_weather['winddir16Point'],
      tide_type: @tide_type,
      tide_time: @tide_time
    }
    condition.save
  end

  def self.update
    weather(SC)
    get_tide
    condition('sc')
    weather(WB_NE)
    get_tide
    condition('wb_ne')
    weather(WB_SE)
    get_tide
    condition('wb_se')
    weather(CB)
    get_tide
    condition('cb')
  end
end
