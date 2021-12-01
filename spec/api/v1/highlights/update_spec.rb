require 'rails_helper'

RSpec.describe "highlights#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/highlights/#{highlight.id}", payload
  end

  describe 'basic update' do
    let!(:highlight) { create(:highlight) }

    let(:payload) do
      {
        data: {
          id: highlight.id.to_s,
          type: 'highlights',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(HighlightResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { highlight.reload.attributes }
    end
  end
end
