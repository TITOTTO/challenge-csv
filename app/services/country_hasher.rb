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
    read_data.each do |country|
      key = country.delete_at(4).parameterize.capitalize()
      hashed_data[key] = country
    end
    hashed_data
  end
end
