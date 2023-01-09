# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::CountriesController, type: :request do

  describe 'index' do
    it 'return success' do
      get countries_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET / show' do
    let(:country) { create(:country) }
    it 'return success' do
      get country_path(country)
      expect(response).to have_http_status(:success)
    end
  end
end
