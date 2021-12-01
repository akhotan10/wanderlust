require "rails_helper"

RSpec.describe "trips#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/trips", params: params
  end

  describe "basic fetch" do
    let!(:trip1) { create(:trip) }
    let!(:trip2) { create(:trip) }

    it "works" do
      expect(TripResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["trips"])
      expect(d.map(&:id)).to match_array([trip1.id, trip2.id])
    end
  end
end
