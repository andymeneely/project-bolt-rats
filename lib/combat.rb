
# This is the simulation of my propose combat mechanic.

class Combat

  def initialize(rng = Random.new)
    @rng = rng
  end

  def attack
    roll = @rng.next(5) + 1
    case roll
    when 1
      return 0
    when 2
      return roll
    when 3
      return roll
    when 4
      return roll
    when 5
      return roll
    when 6
      next_attack = attack()
      if next_attack == 0
        return 0
      else
        return roll + next_attack
      end
    else
      $stderr.puts "ERROR! Invalid roll."
    end
  end

end
