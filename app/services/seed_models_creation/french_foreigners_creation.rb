module SeedModelsCreation
  class FrenchForeignersCreation
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def perform
      french_foreigners_seed
    end

    private

    def french_foreigners_seed
      french_foreigners_hasher.each do |data|
        country = Country.where("country_fr LIKE ?" , "%" + data.first + "%").first
        next if country == nil
        FrenchForeigner.create(country_id: country.id, year: data[1], nbr_fr: data[2])
      end
    end
    
    def csv_reader
      CsvReader.new(@csv).perform
    end

    def french_foreigners_hasher
      FrenchForeigners.new(csv_reader).perform
    end
  end
end
