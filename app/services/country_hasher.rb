class CountryHasher
  attr_reader :read_data, :hashed_data

  def initialize(read_data)
    @read_data = read_data
    @hashed_data = {}
  end

  def perform
    data_hasher
  end

  private

  def data_hasher
    read_data.each do |country_data|
      country_fr = country_data.delete_at(4).parameterize.capitalize() #Saving country_fr to set it as hash's key
      hashed_data[country_fr] = country_data
    end
    hashed_data
  end
end
