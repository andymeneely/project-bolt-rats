require 'squib'
require 'irb'
require 'rake/clean'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

task default: [:deck]

task(:deck)     { load 'lib/deck.rb' }
task(:sim)      { load 'lib/sim_combat.rb' }
task(:boss_sim) { load 'lib/sim_boss_combat.rb' }

task(:tts => :deck) do
  load 'lib/tabletop_simulator.rb'
end
