require "rails_helper"

RSpec.describe "trips#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/trips/#{trip.id}"
  end

  describe "basic destroy" do
    let!(:trip) { create(:trip) }

    it "updates the resource" do
      expect(TripResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Trip.count }.by(-1)
      expect { trip.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
