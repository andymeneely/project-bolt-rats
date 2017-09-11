require 'squib'
require 'irb'
require 'rake/clean'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

task default: [:deck]

task all: [:deck, :tts, :pnp, :rules]

task(:deck)     { load 'lib/deck.rb' }
task(:sim)      { load 'lib/sim_combat.rb' }
task(:boss_sim) { load 'lib/sim_boss_combat.rb' }
task(:rules)    { load 'lib/rules.rb' }

task(:tts => :deck) do
  load 'lib/tabletop_simulator.rb'
end

task(:pnp => :deck) do
  load 'lib/pnp.rb'
end

task(:coin_tracker) { load 'lib/coin_tracker.rb' }
