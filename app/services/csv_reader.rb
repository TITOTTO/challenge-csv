class CsvReader
  attr_reader :csv

  def initialize(csv)
    @csv = csv
  end

  def perform
    csv_reader
  end

  private

  def csv_reader
    CSV.read(csv)
  end
end