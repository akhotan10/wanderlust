require "rails_helper"

RSpec.describe RestaurantResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "restaurants",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RestaurantResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Restaurant.count }.by(1)
    end
  end

  describe "updating" do
    let!(:restaurant) { create(:restaurant) }

    let(:payload) do
      {
        data: {
          id: restaurant.id.to_s,
          type: "restaurants",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RestaurantResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { restaurant.reload.updated_at }
      # .and change { restaurant.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:restaurant) { create(:restaurant) }

    let(:instance) do
      RestaurantResource.find(id: restaurant.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Restaurant.count }.by(-1)
    end
  end
end
