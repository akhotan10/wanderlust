require 'rails_helper'

RSpec.describe "trips#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/trips/#{trip.id}", params: params
  end

  describe 'basic fetch' do
    let!(:trip) { create(:trip) }

    it 'works' do
      expect(TripResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('trips')
      expect(d.id).to eq(trip.id)
    end
  end
end
