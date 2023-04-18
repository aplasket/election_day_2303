require "spec_helper"

RSpec.describe Race do 
  before(:each) do
    @race = Race.new("Texas Governor")
  end
  
  describe "#initialize" do
    it "exists and has attributes" do
      expect(@race).to be_a(Race)
      expect(@race.office).to eq("Texas Governor")
    end

    it "starts with an empty array of candidates" do
      expect(@race.candidates).to eq([])
    end
  end

  describe "#register candidate!" do 
    before(:each) do
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    end

    it "registers a new candidate" do
      expect(@candidate1.class).to eq(Candidate)
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
    end

    it "adds the candidate to the list of candidates" do
      expect(@race.candidates).to eq([@candidate1])

      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(@race.candidates).to eq([@candidate1, candidate2])
    end
  end
end