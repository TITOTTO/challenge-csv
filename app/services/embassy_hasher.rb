class EmbassyHasher
  attr_reader :read_data, :hashed_data

  def initialize(read_data)
    @read_data = []
    array_with_comma(read_data)
    @hashed_data = {}
  end

  def perform
    data_hasher
  end

  private

  def data_hasher
    read_data.each do |embassy|
      key = embassy.delete_at(1).split.first.parameterize.capitalize()
      next if key == "Pays"
      hashed_data[key] = embassy
    end
    hashed_data
  end

  def array_with_comma(embassy_data)
    embassy_data.each do |embassy|
      read_data << embassy.join(',').tr(',', '-').tr(';', ',').split(',')
    end
  end
end
