require 'rails_helper'

RSpec.describe "itineraries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/itineraries/#{itinerary.id}", payload
  end

  describe 'basic update' do
    let!(:itinerary) { create(:itinerary) }

    let(:payload) do
      {
        data: {
          id: itinerary.id.to_s,
          type: 'itineraries',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ItineraryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { itinerary.reload.attributes }
    end
  end
end
