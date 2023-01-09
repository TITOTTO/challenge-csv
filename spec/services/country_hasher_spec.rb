# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::CountryHasher, type: :service do
  let(:csv_reader) { CsvReader.new("db/countries.csv").perform }
  let(:country_hasher) { CountryHasher.new(csv_reader) }
  let(:hashed_data) { country_hasher.perform }

  describe 'perform' do
    it {expect(hashed_data).is_a?(Hash)}
    it {expect(hashed_data["France"]).to eq(["75", "250", "FR", "FRA", "France"])}
  end
  
end