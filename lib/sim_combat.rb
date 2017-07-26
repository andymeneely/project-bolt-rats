require 'csv'
require_relative 'combat'

combat = Combat.new(Random.new(12345))
n = 1000

CSV.open("data/combat_sim_results.csv", 'w+') do |csv|
  csv << %w(my_hp my_atk creature_hp creature_atk win%)
  1.upto(20).each do |my_hp|
    0.upto(4).each do |my_atk|
      1.upto(25).each do |cr_hp|
        2.upto(5).each do |cr_atk|
          wins = 0
          n.times do
            wins +=1 if combat.win?(my_hp, my_atk, cr_hp, cr_atk)
          end
          csv << [my_hp, my_atk, cr_hp, cr_atk, wins.to_f / n.to_f]
        end
      end
    end
  end
end

puts "Simluation completed. Written to file."
