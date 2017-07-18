
# This is the simulation of my propose combat mechanic.

class Combat

  def initialize(rng = Random.new)
    @rng = rng
  end

  def roll
    @rng.next
  end

end
