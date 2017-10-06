class AddIndexToWeatherReadings < ActiveRecord::Migration[5.1]
  def change
    add_index :weather_readings, [:reading_date, :reading_type]
  end
end
