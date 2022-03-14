require "rails_helper"

RSpec.describe "museums#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/museums", params: params
  end

  describe "basic fetch" do
    let!(:museum1) { create(:museum) }
    let!(:museum2) { create(:museum) }

    it "works" do
      expect(MuseumResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["museums"])
      expect(d.map(&:id)).to match_array([museum1.id, museum2.id])
    end
  end
end
