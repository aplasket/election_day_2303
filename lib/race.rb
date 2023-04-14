class Race
  attr_reader :office
  attr_accessor :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(info)
    candidate = Candidate.new(info)
  end

  def add_candidates(candidate)
    @candidates << candidate
  end

end