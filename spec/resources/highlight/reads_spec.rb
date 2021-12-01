require "rails_helper"

RSpec.describe HighlightResource, type: :resource do
  describe "serialization" do
    let!(:highlight) { create(:highlight) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(highlight.id)
      expect(data.jsonapi_type).to eq("highlights")
    end
  end

  describe "filtering" do
    let!(:highlight1) { create(:highlight) }
    let!(:highlight2) { create(:highlight) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: highlight2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([highlight2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:highlight1) { create(:highlight) }
      let!(:highlight2) { create(:highlight) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      highlight1.id,
                                      highlight2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      highlight2.id,
                                      highlight1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
