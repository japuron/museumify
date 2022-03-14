require 'rails_helper'

RSpec.describe ArtpieceResource, type: :resource do
  describe 'serialization' do
    let!(:artpiece) { create(:artpiece) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(artpiece.id)
      expect(data.jsonapi_type).to eq('artpieces')
    end
  end

  describe 'filtering' do
    let!(:artpiece1) { create(:artpiece) }
    let!(:artpiece2) { create(:artpiece) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: artpiece2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([artpiece2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:artpiece1) { create(:artpiece) }
      let!(:artpiece2) { create(:artpiece) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            artpiece1.id,
            artpiece2.id
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
            artpiece2.id,
            artpiece1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
