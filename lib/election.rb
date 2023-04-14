class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race_info)
    @races << race_info
  end

  def candidates(race)
    race.candidates
  end

  def vote_counts(race)
    require 'pry'; binding.pry

    candidate_name = race.candidates.map do |candidate|
      candidiate.name
    end

    
    votes = {
      candidate_name: candidate.votes
    }
  end
end