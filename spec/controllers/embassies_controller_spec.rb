# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::EmbassiesController, type: :request do

  describe 'index' do
    it 'return success' do
      get embassies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET / show' do
    let(:embassy) { create(:embassy)}
    it 'return success' do
      get embassies_path(embassy)
      expect(response).to have_http_status(:success)
    end
  end
end
