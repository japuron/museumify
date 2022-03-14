require "rails_helper"

RSpec.describe "museums#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/museums/#{museum.id}", params: params
  end

  describe "basic fetch" do
    let!(:museum) { create(:museum) }

    it "works" do
      expect(MuseumResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("museums")
      expect(d.id).to eq(museum.id)
    end
  end
end
