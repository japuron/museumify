require "rails_helper"

RSpec.describe "artpieces#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/artpieces/#{artpiece.id}"
  end

  describe "basic destroy" do
    let!(:artpiece) { create(:artpiece) }

    it "updates the resource" do
      expect(ArtpieceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Artpiece.count }.by(-1)
      expect { artpiece.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
