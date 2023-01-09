require 'csv'
require 'pry'

csv = CsvReader.new("db/csv/countries.csv").perform
countries = CountryHasher.new(csv).perform
countries.each do |country, data|
  Country.create(country_fr: country, country_en: data[4], iso_numerical: data[1], iso_alpha2: data[2], iso_alpha3: data[3])
end

csv = CsvReader.new("db/csv/embassy.csv").perform
embassies = EmbassyHasher.new(csv).perform
embassies.each do |embassy, data|
  country = Country.where("country_fr LIKE ?" , "%" + embassy + "%").first
  next if country == nil
  Embassy.create(country_id: country.id, building: data[0], latitude: data[1], longitude: data[2], contact: data[3])
end

csv = CsvReader.new("db/csv/french-foreigners.csv").perform
french_foreigners = FrenchForeigners.new(csv).perform
french_foreigners.each do |data|
  country = Country.where("country_fr LIKE ?" , "%" + data.first + "%").first
  next if country == nil
  FrenchForeigner.create(country_id: country.id, year: data[1], nbr_fr: data[2])
end
