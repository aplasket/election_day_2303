class Race
  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(info)
    candidate = Candidate.new(info)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?
    @candidates.max_by(&:votes)

    # the &: here is the same as @candidates.max_by {|candidate| candidate.votes}
  end

  def tie?
    top_candidates = candidates.map(&:votes).max(2)
    top_candidates.first == top_candidates.last
  end
end