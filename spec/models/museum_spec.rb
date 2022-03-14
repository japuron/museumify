require 'rails_helper'

RSpec.describe Museum, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:artpieces) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
