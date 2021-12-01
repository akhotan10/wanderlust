require "rails_helper"

RSpec.describe "eating_lists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/eating_lists", params: params
  end

  describe "basic fetch" do
    let!(:eating_list1) { create(:eating_list) }
    let!(:eating_list2) { create(:eating_list) }

    it "works" do
      expect(EatingListResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["eating_lists"])
      expect(d.map(&:id)).to match_array([eating_list1.id, eating_list2.id])
    end
  end
end
