require 'spec_helper'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe "#initialize" do
    it "exists" do
      expect(@diana).to be_a(Candidate)
    end

    it "has attributes" do
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq(:democrat)
    end

    it "starts with 0 votes" do
      expect(@diana.votes).to eq(0)
    end
  end

  describe "#vote for" do
    it "can count how many votes candidate has" do
      
    end
  end
end