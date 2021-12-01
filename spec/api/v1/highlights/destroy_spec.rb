require "rails_helper"

RSpec.describe "highlights#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/highlights/#{highlight.id}"
  end

  describe "basic destroy" do
    let!(:highlight) { create(:highlight) }

    it "updates the resource" do
      expect(HighlightResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Highlight.count }.by(-1)
      expect { highlight.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
