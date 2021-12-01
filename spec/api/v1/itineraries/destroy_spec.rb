require "rails_helper"

RSpec.describe "itineraries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/itineraries/#{itinerary.id}"
  end

  describe "basic destroy" do
    let!(:itinerary) { create(:itinerary) }

    it "updates the resource" do
      expect(ItineraryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Itinerary.count }.by(-1)
      expect { itinerary.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
