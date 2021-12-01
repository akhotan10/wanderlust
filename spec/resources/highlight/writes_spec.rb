require 'rails_helper'

RSpec.describe HighlightResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'highlights',
          attributes: { }
        }
      }
    end

    let(:instance) do
      HighlightResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Highlight.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:highlight) { create(:highlight) }

    let(:payload) do
      {
        data: {
          id: highlight.id.to_s,
          type: 'highlights',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      HighlightResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { highlight.reload.updated_at }
      # .and change { highlight.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:highlight) { create(:highlight) }

    let(:instance) do
      HighlightResource.find(id: highlight.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Highlight.count }.by(-1)
    end
  end
end
