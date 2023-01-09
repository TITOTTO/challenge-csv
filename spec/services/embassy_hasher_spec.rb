# frozen_string_literal: true

require "rails_helper"

RSpec.describe EmbassyHasher do
  let(:csv_reader) { CsvReader.new("db/csv/embassy.csv").perform }
  let(:embassy_hasher) { EmbassyHasher.new(csv_reader) }
  let(:hashed_data) { embassy_hasher.perform }

  describe 'perform' do
    it {expect(hashed_data).is_a?(Hash)}
    it {expect(hashed_data["Finlande"]).to eq(["Ambassade de France", "60.1568092", "24.9604747", "60.1568092-24.9604747"])}
  end
  
end