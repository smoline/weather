require 'csv'

namespace :db do
  namespace :seed do
    desc "Import NOAA weather CSV"
    task import_noaa_weather: :environment do
      filename = File.join(Rails.root, 'db', 'data_files', '1836.csv')
      CSV.foreach(filename, headers: false) do |row|
        puts $. if $. % 10000 == 0
        date_parts = row[1].match(/(\d{4})(\d{2})(\d{2})/)
        date = Date.civil(date_parts[1].to_i, date_parts[2].to_i, date_parts[3].to_i)
        data = {
          station: row[0],
          reading_date: date,
          reading_type: row[2],
          reading_value: Integer(row[3]),
          measurement_flag: row[4],
          quality_flag: row[5],
          source_flag: row[6],
          observation_time: row[7]
        }
        WeatherReading.create(data)
      end
    end
  end
end
