require 'rails_helper'

RSpec.describe ArtpieceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'artpieces',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ArtpieceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Artpiece.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:artpiece) { create(:artpiece) }

    let(:payload) do
      {
        data: {
          id: artpiece.id.to_s,
          type: 'artpieces',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ArtpieceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { artpiece.reload.updated_at }
      # .and change { artpiece.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:artpiece) { create(:artpiece) }

    let(:instance) do
      ArtpieceResource.find(id: artpiece.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Artpiece.count }.by(-1)
    end
  end
end
