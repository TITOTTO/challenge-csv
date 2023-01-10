class Seed
  def initialize

  end

  def perform
    ::SeedModelsCreation::CountriesCreation.new("db/csv/countries.csv").perform
    ::SeedModelsCreation::EmbassiesCreation.new("db/csv/embassy.csv").perform
    ::SeedModelsCreation::FrenchForeignersCreation.new("db/csv/french-foreigners.csv").perform
  end
end
