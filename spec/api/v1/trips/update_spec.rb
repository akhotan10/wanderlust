require 'rails_helper'

RSpec.describe "trips#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/trips/#{trip.id}", payload
  end

  describe 'basic update' do
    let!(:trip) { create(:trip) }

    let(:payload) do
      {
        data: {
          id: trip.id.to_s,
          type: 'trips',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TripResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { trip.reload.attributes }
    end
  end
end
