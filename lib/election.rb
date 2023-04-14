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

  def candidates
    @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    votes = {}
    
    candidates.map do |candidate|
      votes[candidate.name] = candidate.votes
    end

    votes
    
    #alternatively:
    #candidates.map {|candidate| [candidate.name, candidate.votes]}.to_h
  end


end