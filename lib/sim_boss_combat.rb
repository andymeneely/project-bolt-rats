require 'csv'
require_relative 'combat'

combat = Combat.new(Random.new(12345))
n = 1000

CSV.open("data/combat_boss_sim_results.csv", 'w+') do |csv|
  csv << %w(my_hp my_atk boss_hp win%)
  1.upto(20).each do |my_hp|
    0.upto(4).each do |my_atk|
      1.upto(30).each do |boss_hp|
          wins = 0
          n.times do
            wins +=1 if combat.boss_win?(my_hp, my_atk, boss_hp)
          end
          csv << [my_hp, my_atk, boss_hp, wins.to_f / n.to_f]
      end
    end
  end
end

puts "Simluation completed. Written to file."
