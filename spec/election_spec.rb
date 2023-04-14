require "spec_helper"

RSpec.describe Election do
  before(:each) do
    @election = Election.new("1999")
    @race1 = Race.new("Texas Governor")
    @race2 = Race.new("North Dakota Mayor")
  end

  describe "#initialize" do
    it "exists" do
      expect(@election).to be_a(Election)
    end

    it "has attributes" do
      expect(@election.year).to eq("1999")
    end

    it "starts with an empty array of races" do
      expect(@election.candidates).to eq([])
    end

    it "starts with an empty array of candidates" do
      expect(@election.candidates).to eq([])
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
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race2.register_candidate!({name: "Bob B", party: :green})
      @candidate4 = @race2.register_candidate!({name: "Mickey Mouse", party: :fun})
      expect(@election.candidates).to eq([])

      @election.add_race(@race1)
      @election.add_race(@race2)
      expect(@election.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4])
    end
  end

  describe "#vote counts" do
    it "adds candidates name and their vote counts to a hash" do
      @election.add_race(@race1)
      @election.add_race(@race2)
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race2.register_candidate!({name: "Bob B", party: :green})
      @candidate4 = @race2.register_candidate!({name: "Mickey Mouse", party: :fun})
      6.times { @candidate1.vote_for! }
      10.times { @candidate2.vote_for! }
      16.times { @candidate3.vote_for! }
      100.times { @candidate4.vote_for! }
      
      expect(@election.vote_counts).to be_a(Hash)
      expect(@election.vote_counts).to eq({ "Diana D" => 6, 
                                            "Roberto R" => 10,
                                            "Bob B" => 16, 
                                            "Mickey Mouse" => 100})
    end
  end
end