require "spec_helper"

RSpec.describe Election do 
  before(:each) do
    @election = Election.new("2023")
    @race1 = Race.new("Texas Governor")
    @race2 = Race.new("Texas Mayor")
  end

  describe "initialize" do
    it "exists and has attributes" do
      expect(@election).to be_an(Election)
      expect(@election.year).to eq("2023")
    end

    it "starts with an empty array of race objects" do 
      expect(@election.races).to eq([])
    end
  end

  describe "#add_race" do
    it "adds a new race to the list" do
      @election.add_race(@race1)
      expect(@election.races).to eq([@race1])

      @election.add_race(@race2)
      expect(@election.races).to eq([@race1, @race2])
    end
  end

  describe "#candidates" do 
    before(:each) do
      @election.add_race(@race1)
      @election.add_race(@race2)
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race2.register_candidate!({name: "Billie Bob", party: :green})
      @candidate4 = @race2.register_candidate!({name: "Mickey Mouse", party: :fun})
    end

    it "returns a list of candidates" do 
      expect(@election.candidates).to eq([@candidate1, @candidate2, @candidate3, @candidate4])
    end
  end

  describe "#vote counts" do 
    before(:each) do
      @election.add_race(@race1)
      @election.add_race(@race2)
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race2.register_candidate!({name: "Billie Bob", party: :green})
      @candidate4 = @race2.register_candidate!({name: "Mickey Mouse", party: :fun})

      3.times {@candidate1.vote_for!}
      5.times {@candidate2.vote_for!}
      13.times {@candidate3.vote_for!}
      22.times {@candidate4.vote_for!}
    end
    
    it "returns a hash of each candidate and their vote counts" do
      expect(@election.vote_counts).to eq({ @candidate1 => 3, 
                                            @candidate2 => 5, 
                                            @candidate3 => 13, 
                                            @candidate4 => 22 })
    end
  end
end

