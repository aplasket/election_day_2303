class Election
  attr_reader :year,
              :race

  def initialize(year)
    @year = year
    @race = []
  end

  def add_race(race_info)
    @race << race_info
  end

  def candidates(race)
    @race.candidates
  end
end