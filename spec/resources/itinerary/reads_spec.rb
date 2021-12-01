require 'rails_helper'

RSpec.describe ItineraryResource, type: :resource do
  describe 'serialization' do
    let!(:itinerary) { create(:itinerary) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(itinerary.id)
      expect(data.jsonapi_type).to eq('itineraries')
    end
  end

  describe 'filtering' do
    let!(:itinerary1) { create(:itinerary) }
    let!(:itinerary2) { create(:itinerary) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: itinerary2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([itinerary2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:itinerary1) { create(:itinerary) }
      let!(:itinerary2) { create(:itinerary) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            itinerary1.id,
            itinerary2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            itinerary2.id,
            itinerary1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
