require "spec_helper"

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
  end

  describe "#initialize" do
    it "exists" do
      expect(@race).to be_a(Race)
    end

    it "has attributes" do
      expect(@race.office).to eq("Texas Governor")
    end

    it "starts with an empty array of candidates" do
      expect(@race.candidates).to eq([])
    end
  end
end