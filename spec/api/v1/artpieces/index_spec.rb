require "rails_helper"

RSpec.describe "artpieces#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artpieces", params: params
  end

  describe "basic fetch" do
    let!(:artpiece1) { create(:artpiece) }
    let!(:artpiece2) { create(:artpiece) }

    it "works" do
      expect(ArtpieceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["artpieces"])
      expect(d.map(&:id)).to match_array([artpiece1.id, artpiece2.id])
    end
  end
end
