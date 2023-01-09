# frozen_string_literal: true

require "rails_helper"

RSpec.describe FrenchForeigners do
  let(:csv_reader) { CsvReader.new("db/csv/french-foreigners.csv").perform }
  let(:french_foreigner) { FrenchForeigners.new(csv_reader) }
  let(:hashed_data) { french_foreigner.perform }
  let(:first_element) {hashed_data.first}

  describe 'perform' do
    it {expect(hashed_data).is_a?(Array)}
    it {expect(first_element).to eq(["Georgie", "2012", "278"])}
  end
  
end