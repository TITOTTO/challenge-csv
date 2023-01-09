# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::FrenchForeignersController, type: :request do

  describe 'index' do
    it 'return success' do
      get french_foreigners_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET / show' do
    let(:french_foreigner) { create(:french_foreigner) }
    it 'return success' do
      get french_foreigner_path(french_foreigner)
      expect(response).to have_http_status(:success)
    end
  end
end
