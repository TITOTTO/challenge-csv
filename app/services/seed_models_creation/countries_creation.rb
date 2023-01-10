module SeedModelsCreation
  class CountriesCreation
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def perform
      countries_seed
    end

    private

    def countries_seed
      country_hasher.each do |country, data|
        Country.create(country_fr: country, country_en: data[4], iso_numerical: data[1], iso_alpha2: data[2], iso_alpha3: data[3])
      end
    end

    def csv_reader
      CsvReader.new(@csv).perform
    end

    def country_hasher
      CountryHasher.new(csv_reader).perform
    end
  end
end
