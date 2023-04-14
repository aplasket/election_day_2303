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
  
  describe "#register candidates" do
    it "can register candidates and add to array" do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end
  
  describe "#open?" do
    it "is open by default" do
      expect(@race.open?).to be(true)
    end
  end

  describe "#close!" do
    it "can close a race" do
      @race.close!
      expect(@race.open?).to be(false)
    end
  end

  describe "#winner" do
    before(:each) do
      @race1 = Race.new("Texas Governor")
      @race2 = Race.new("North Dakota Mayor")
      @race3 = Race.new("Co governor")
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race1.register_candidate!({name: "Bob B", party: :green})
      @candidate4 = @race2.register_candidate!({name: "Mickey Mouse", party: :fun})
      @candidate45 = @race3.register_candidate!({name: "Ida", party: :independent})
      # 6.times { @candidate1.vote_for! }
      # 10.times { @candidate2.vote_for! }
      # 16.times { @candidate3.vote_for! }
      # 100.times { @candidate4.vote_for! }
      # 2.times { @candidate5.vote_for! }
    end

    it "can declare a winner if race is closed" do
      6.times { @candidate1.vote_for! }
      10.times { @candidate2.vote_for! }
      @race1.close!

      expect(@race1.winner).to eq(@candidate2)
    end

    it "can not declare a winner if race is open" do
      6.times { @candidate1.vote_for! }
      10.times { @candidate2.vote_for! }

      expect(@race1.winner).to be(false)
    end
  end

  describe "#tie?" do
    before(:each) do
      @race1 = Race.new("Texas Governor")
      @race2 = Race.new("North Dakota Mayor")
      @race3 = Race.new("Co governor")
      @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
      @candidate3 = @race1.register_candidate!({name: "Bob B", party: :green})
    end

    it "can determine if there's a tie" do
      10.times { @candidate1.vote_for! }
      10.times { @candidate2.vote_for! }
      11.times { @candidate3.vote_for! }
      @race1.close!

      expect(@race1.tie?).to be(false)

      @candidate1.vote_for! 
      
      expect(@race1.tie?).to be(true)
      expect(@race1.winner).to eq(@candidate1).or eq(@candidate2)
    end

  end
end