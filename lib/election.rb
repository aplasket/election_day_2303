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
    votes = {}
    
    race.candidates.map do |candidate|
      votes[candidate.name] = candidate.votes
    end

    votes
  end
end