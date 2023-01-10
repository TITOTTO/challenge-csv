class FrenchForeigners
  attr_reader :read_data, :array_data

  def initialize(read_data)
    @read_data = []
    @array_data = []
    array_with_comma(read_data)
  end

  def perform
    data_array
  end

  private

  def data_array
    read_data.each do |french_foreigners_data|
      next if french_foreigners_data.first == "Pays"
      french_foreigners_data[0] = french_foreigners_data.first.parameterize.capitalize()
      array_data << french_foreigners_data
    end
    array_data
  end

  def array_with_comma(embassy_data)
    embassy_data.each do |embassy|
      read_data << embassy.join(';').tr(';', ',').split(',')
    end
  end
end
