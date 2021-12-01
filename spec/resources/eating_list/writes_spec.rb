require 'rails_helper'

RSpec.describe EatingListResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'eating_lists',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EatingListResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { EatingList.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:eating_list) { create(:eating_list) }

    let(:payload) do
      {
        data: {
          id: eating_list.id.to_s,
          type: 'eating_lists',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EatingListResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { eating_list.reload.updated_at }
      # .and change { eating_list.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:eating_list) { create(:eating_list) }

    let(:instance) do
      EatingListResource.find(id: eating_list.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { EatingList.count }.by(-1)
    end
  end
end
