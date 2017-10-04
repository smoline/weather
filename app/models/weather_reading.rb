class WeatherReading < ApplicationRecord
  has_one :weather_station, foreign_key: 'station_id', primary_key: 'station'
end
