require "rails_helper"

RSpec.describe "highlights#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/highlights", params: params
  end

  describe "basic fetch" do
    let!(:highlight1) { create(:highlight) }
    let!(:highlight2) { create(:highlight) }

    it "works" do
      expect(HighlightResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["highlights"])
      expect(d.map(&:id)).to match_array([highlight1.id, highlight2.id])
    end
  end
end
