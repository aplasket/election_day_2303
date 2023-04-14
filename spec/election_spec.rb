require "spec_helper"

RSpec.describe Election do
  before(:each) do
    @election = Election.new("1999")
    @race1 = Race.new("Texas Governor")
  end

  describe "#initialize" do
    it "exists" do
      expect(@election).to be_a(Election)
    end

    it "has attributes" do
      expect(@election.year).to eq("1999")
    end

    it "starts with an empty array of races" do
      expect(@election.candidates(@race1)).to eq([])
    end

    it "starts with an empty array of candidates" do
      expect(@election.candidates(@race1)).to eq([])
    end
  end

  describe "#add race" do
    it "can add race objects to race array" do
      expect(@election.add_race(@race1)).to eq([@race1])
      expect(@election.races).to eq([@race1])
    end
  end

  describe "add candidates" do
    it "can add candidates to candidate array" do
      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @race1.add_candidates(candidate1)
      @race1.add_candidates(candidate2)

      expect(@election.candidates(@race1)).to eq([candidate1, candidate2])
    end
  end

  describe "#vote counts" do
    xit "adds candidates name and their vote counts to a hash" do
      candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @race1.add_candidates(candidate1)
      @race1.add_candidates(candidate2)
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate2.vote_for!
      
      expect(@election.vote_counts(@race1)).to be_a(Hash)
      expect(@election.vote_counts(@race1)).to eq({"Diana D" => 2, "Roberto R" => 1})
    end


  end
end