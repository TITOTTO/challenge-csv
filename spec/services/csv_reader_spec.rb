# frozen_string_literal: true

require "rails_helper"

RSpec.describe CsvReader do

  describe 'perform' do
    let(:csv_reader) { CsvReader.new("db/csv/countries.csv") }
    let(:data_read) { csv_reader.perform }
    it {expect(csv_reader.perform).is_a?(Hash)}
    it {expect(data_read[0]).to eq(["1", "4", "AF", "AFG", "Afghanistan", "Afghanistan"])}
  end
  
end