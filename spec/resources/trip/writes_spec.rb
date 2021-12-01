require 'rails_helper'

RSpec.describe TripResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'trips',
          attributes: { }
        }
      }
    end

    let(:instance) do
      TripResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Trip.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:trip) { create(:trip) }

    let(:payload) do
      {
        data: {
          id: trip.id.to_s,
          type: 'trips',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TripResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { trip.reload.updated_at }
      # .and change { trip.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:trip) { create(:trip) }

    let(:instance) do
      TripResource.find(id: trip.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Trip.count }.by(-1)
    end
  end
end
