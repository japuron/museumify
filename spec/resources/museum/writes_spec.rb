require "rails_helper"

RSpec.describe MuseumResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "museums",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MuseumResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Museum.count }.by(1)
    end
  end

  describe "updating" do
    let!(:museum) { create(:museum) }

    let(:payload) do
      {
        data: {
          id: museum.id.to_s,
          type: "museums",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MuseumResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { museum.reload.updated_at }
      # .and change { museum.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:museum) { create(:museum) }

    let(:instance) do
      MuseumResource.find(id: museum.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Museum.count }.by(-1)
    end
  end
end
