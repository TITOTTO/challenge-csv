module SeedModelsCreation
  class EmbassiesCreation
    attr_reader :csv

    def initialize(csv)
      @csv = csv
    end

    def perform
      embassies_seed
    end

    private

    def embassies_seed
      embassy_hasher.each do |embassy, data|
        country = Country.where("country_fr LIKE ?" , "%" + embassy + "%").first
        next if country == nil
        Embassy.create(country_id: country.id, building: data[0], latitude: data[1], longitude: data[2], contact: data[3])
      end
    end

    def csv_reader
      CsvReader.new(@csv).perform
    end

    def embassy_hasher
      EmbassyHasher.new(csv_reader).perform
    end
  end
end
