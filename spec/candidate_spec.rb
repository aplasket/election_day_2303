require "spec_helper"

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat}) 
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@diana).to be_a(Candidate)
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq(:democrat)
    end

    it "starts with 0 votes" do
      expect(@diana.votes).to eq(0)
    end
  end

  describe "#vote_for!" do
    it "adds a vote" do
      @diana.vote_for!
      expect(@diana.votes).to eq(1)
      @diana.vote_for!
      @diana.vote_for!
      expect(@diana.votes).to eq(3)
      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
end