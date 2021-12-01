require "rails_helper"

RSpec.describe EatingListResource, type: :resource do
  describe "serialization" do
    let!(:eating_list) { create(:eating_list) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(eating_list.id)
      expect(data.jsonapi_type).to eq("eating_lists")
    end
  end

  describe "filtering" do
    let!(:eating_list1) { create(:eating_list) }
    let!(:eating_list2) { create(:eating_list) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: eating_list2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([eating_list2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:eating_list1) { create(:eating_list) }
      let!(:eating_list2) { create(:eating_list) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      eating_list1.id,
                                      eating_list2.id,
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
                                      eating_list2.id,
                                      eating_list1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
