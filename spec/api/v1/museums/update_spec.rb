require 'rails_helper'

RSpec.describe "museums#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/museums/#{museum.id}", payload
  end

  describe 'basic update' do
    let!(:museum) { create(:museum) }

    let(:payload) do
      {
        data: {
          id: museum.id.to_s,
          type: 'museums',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MuseumResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { museum.reload.attributes }
    end
  end
end
