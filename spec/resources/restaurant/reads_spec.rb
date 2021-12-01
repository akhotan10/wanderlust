require "rails_helper"

RSpec.describe RestaurantResource, type: :resource do
  describe "serialization" do
    let!(:restaurant) { create(:restaurant) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(restaurant.id)
      expect(data.jsonapi_type).to eq("restaurants")
    end
  end

  describe "filtering" do
    let!(:restaurant1) { create(:restaurant) }
    let!(:restaurant2) { create(:restaurant) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: restaurant2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([restaurant2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:restaurant1) { create(:restaurant) }
      let!(:restaurant2) { create(:restaurant) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      restaurant1.id,
                                      restaurant2.id,
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
                                      restaurant2.id,
                                      restaurant1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
