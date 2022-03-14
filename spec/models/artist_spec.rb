require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "Direct Associations" do
    it { should have_many(:artpieces) }
  end

  describe "InDirect Associations" do
    it { should have_many(:exhibitions) }
  end

  describe "Validations" do
  end
end
