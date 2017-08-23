require 'squib'

puts "Building Tabletop Simulator assets..."

Squib::Deck.new(width: 825 * 3, height: 1125 * 3, cards: 2) do
  background color: :white
  Dir['_output/creature_big_*.png'].to_a.sort.each.with_index do |f,i|
    png file: "../#{f}",
        x: 825 * (i % 3),
        y: 1125 * (i / 3),
        range: 0
  end
  Dir['_output/creature_small_*.png'].to_a.sort.each.with_index do |f,i|
    png file: "../#{f}",
        x: 825 * (i % 3),
        y: 1125 * (i / 3),
        range: 1
  end
  png file: "../_output/resource_00.png",
      x: 825,
      y: 1125 * 2,
      range: 0
  png file: "../_output/resource_01.png",
      x: 825 * 2,
      y: 1125 * 2,
      range: 0
  png file: "../_output/resource_02.png",
      x: 825 * 2,
      y: 1125 * 2,
      range: 1
  save_png prefix: 'tabletop_simulator_asset_'
end
