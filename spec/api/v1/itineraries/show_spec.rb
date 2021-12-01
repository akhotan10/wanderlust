require "rails_helper"

RSpec.describe "itineraries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/itineraries/#{itinerary.id}", params: params
  end

  describe "basic fetch" do
    let!(:itinerary) { create(:itinerary) }

    it "works" do
      expect(ItineraryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("itineraries")
      expect(d.id).to eq(itinerary.id)
    end
  end
end
