require 'rails_helper'

RSpec.describe ItineraryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'itineraries',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ItineraryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Itinerary.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:itinerary) { create(:itinerary) }

    let(:payload) do
      {
        data: {
          id: itinerary.id.to_s,
          type: 'itineraries',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ItineraryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { itinerary.reload.updated_at }
      # .and change { itinerary.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:itinerary) { create(:itinerary) }

    let(:instance) do
      ItineraryResource.find(id: itinerary.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Itinerary.count }.by(-1)
    end
  end
end
