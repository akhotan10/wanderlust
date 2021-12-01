require "rails_helper"

RSpec.describe "restaurants#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/restaurants/#{restaurant.id}", payload
  end

  describe "basic update" do
    let!(:restaurant) { create(:restaurant) }

    let(:payload) do
      {
        data: {
          id: restaurant.id.to_s,
          type: "restaurants",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RestaurantResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { restaurant.reload.attributes }
    end
  end
end
