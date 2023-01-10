# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Country, type: :model do

  describe 'validate' do
    it 'return error' do
      let(:country) { Country.new(country_fr: "France", country_en:"France", iso_numerical: 12, iso_alpha2: "FR", iso_alpha3: "FR")}
      expect(country.save).to raise :error
    end
  end
end
