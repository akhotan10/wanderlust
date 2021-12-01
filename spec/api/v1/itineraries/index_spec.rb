require 'rails_helper'

RSpec.describe "itineraries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/itineraries", params: params
  end

  describe 'basic fetch' do
    let!(:itinerary1) { create(:itinerary) }
    let!(:itinerary2) { create(:itinerary) }

    it 'works' do
      expect(ItineraryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['itineraries'])
      expect(d.map(&:id)).to match_array([itinerary1.id, itinerary2.id])
    end
  end
end
