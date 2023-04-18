class Election 
  attr_reader :year,
              :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    all_candidates = []
    @races.each do |race|
      all_candidates << race.candidates
    end
    all_candidates.flatten
  end

  def vote_counts
    vote_per_candidate= {}

    @races.each do |race|
      race.candidates.each do |candidate|
        vote_per_candidate[candidate] = candidate.votes
      end
    end

    vote_per_candidate
  end
end