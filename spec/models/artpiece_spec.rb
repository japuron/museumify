require 'rails_helper'

RSpec.describe Artpiece, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:museum) }

    it { should have_many(:likes) }

    it { should belong_to(:artist) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
