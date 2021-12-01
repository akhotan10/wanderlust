require 'rails_helper'

RSpec.describe "restaurants#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/restaurants", params: params
  end

  describe 'basic fetch' do
    let!(:restaurant1) { create(:restaurant) }
    let!(:restaurant2) { create(:restaurant) }

    it 'works' do
      expect(RestaurantResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['restaurants'])
      expect(d.map(&:id)).to match_array([restaurant1.id, restaurant2.id])
    end
  end
end
