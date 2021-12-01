require 'rails_helper'

RSpec.describe "countries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/countries/#{country.id}", payload
  end

  describe 'basic update' do
    let!(:country) { create(:country) }

    let(:payload) do
      {
        data: {
          id: country.id.to_s,
          type: 'countries',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CountryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { country.reload.attributes }
    end
  end
end