require "rails_helper"

RSpec.describe "highlights#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/highlights/#{highlight.id}", params: params
  end

  describe "basic fetch" do
    let!(:highlight) { create(:highlight) }

    it "works" do
      expect(HighlightResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("highlights")
      expect(d.id).to eq(highlight.id)
    end
  end
end
