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
    read_data.each do |embassy|
      next if embassy.first == "Pays"
      embassy[0] = embassy.first.parameterize.capitalize()
      array_data << embassy
    end
    array_data
  end

  def array_with_comma(embassy_data)
    embassy_data.each do |embassy|
      read_data << embassy.join(';').tr(';', ',').split(',')
    end
  end
end
