require "rails_helper"

RSpec.describe "restaurants#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/restaurants/#{restaurant.id}", params: params
  end

  describe "basic fetch" do
    let!(:restaurant) { create(:restaurant) }

    it "works" do
      expect(RestaurantResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("restaurants")
      expect(d.id).to eq(restaurant.id)
    end
  end
end
