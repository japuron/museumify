require "rails_helper"

RSpec.describe "artpieces#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/artpieces/#{artpiece.id}", payload
  end

  describe "basic update" do
    let!(:artpiece) { create(:artpiece) }

    let(:payload) do
      {
        data: {
          id: artpiece.id.to_s,
          type: "artpieces",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ArtpieceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { artpiece.reload.attributes }
    end
  end
end
