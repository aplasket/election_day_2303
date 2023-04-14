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
    candidate_name = race.candidates.map do |candidate|
      candidiate.name
    end

    num_votes = race.candidates.map do |candidate|
      candidate.votes
    end

    votes = {}
    votes[candidate_name] = num_votes
    votes
  end
end