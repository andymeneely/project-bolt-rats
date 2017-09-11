require 'squib'
require_relative './helpers'
require_relative './version'

data = Squib.xlsx(file: 'data/game.xlsx', sheet: 1)

File.open('data/tools.txt', 'w+') do |f|
  f.write data.recipe.zip(data.bonus).map { |r,b| "#{r}\n#{b}" }.
          join("\n\n")
end

Squib::Deck.new(cards: 1, width: '8in', height: '10.5in') do
  background color: :white
  svg file: 'coin_tracker.svg', width: '8in', height: '10.5in'

  # item_bonuses = data.recipe.zip(data.bonus).map do |r,b|
  #   "<b>#{r}</b>. <i>#{b}</i> "
  # end.join("\n \n")
  # text range: 1, font: 'Archivo Narrow, Sans 32', markup: true,
  #      spacing: -8,
  #      x: 150, y: 75, width: 575, ellipsize: false,
  #      str: item_bonuses
  # 0.upto(6).each do |n|
  #   y = n * 125 + 85
  #   # y += 10 if n == 4 # Tape dispensor adjustment
  #   y += 10 if n == 5 # Tote bag adjustment
  #   y -= 10 if n == 6 # Whacking plank adjustment
  #   rect x: 75, y: y, width: 65, height: 65,
  #        radius: 15, range: 1, stroke_width: 4
  # end
  # text str: "<b>Zeppelin:</b>\n8 Metal, 6 Fabric, 4 Oil, 3 Duct Tape",
  #      font: 'Archivo Narrow, Sans 32', range: 1, markup: true,
  #      x: 75, y: 950, width: 675, ellipsize: false, align: :center
  save_pdf file: 'coin_tracker.pdf',
           width: '8.5in',
           height: '11in',
           crop_marks: false
end
