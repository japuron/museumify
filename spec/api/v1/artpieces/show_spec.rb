require "rails_helper"

RSpec.describe "artpieces#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artpieces/#{artpiece.id}", params: params
  end

  describe "basic fetch" do
    let!(:artpiece) { create(:artpiece) }

    it "works" do
      expect(ArtpieceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("artpieces")
      expect(d.id).to eq(artpiece.id)
    end
  end
end
