require "rails_helper"

RSpec.describe "eating_lists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/eating_lists/#{eating_list.id}", params: params
  end

  describe "basic fetch" do
    let!(:eating_list) { create(:eating_list) }

    it "works" do
      expect(EatingListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("eating_lists")
      expect(d.id).to eq(eating_list.id)
    end
  end
end
