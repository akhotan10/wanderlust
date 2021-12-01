require 'rails_helper'

RSpec.describe "eating_lists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/eating_lists/#{eating_list.id}", payload
  end

  describe 'basic update' do
    let!(:eating_list) { create(:eating_list) }

    let(:payload) do
      {
        data: {
          id: eating_list.id.to_s,
          type: 'eating_lists',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EatingListResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { eating_list.reload.attributes }
    end
  end
end
