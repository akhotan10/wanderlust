require 'rails_helper'

RSpec.describe "trips#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/trips", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'trips',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(TripResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Trip.count }.by(1)
    end
  end
end
