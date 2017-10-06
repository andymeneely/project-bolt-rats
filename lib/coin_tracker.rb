require 'squib'
require_relative './helpers'
require_relative './version'

data = Squib.xlsx(file: 'data/game.xlsx', sheet: 1)

Squib::Deck.new(cards: 1, width: '8in', height: '10.5in') do
  background color: :white
  svg file: 'coin_tracker.svg', width: '8in', height: '10.5in'

  item_bonuses = data.recipe.zip(data.bonus).map do |r,b|
    "<b>#{r}</b>. <i>#{b}</i> "
  end
  [
    {x: 230, y: 20, width: 340, height: 250},
    {x: 830, y: 20, width: 340, height: 250},
    {x: 1430, y: 20, width: 340, height: 250},
    {x: 2030, y: 20, width: 340, height: 250},
    {x: 540, y: 270, width: 340, height: 250},
    {x: 1140, y: 270, width: 340, height: 250},
    {x: 1740, y: 270, width: 340, height: 250},
  ].each.with_index do |c, i|
    text font: 'Archivo Narrow, Sans 10',
         markup: true,
         spacing: -8,
         valign: :middle,
         str: item_bonuses[i],
         x: c[:x],
         y: c[:y],
         width: c[:width],
         height: c[:height]
  end
  text str: "<b>Zeppelin:</b> 8 Metal, 6 Fabric, 4 Oil, 3 Duct Tape",
       font: 'Archivo Narrow, Sans 17', markup: true, x: 75, y: 550,
       width: 2250, ellipsize: false, align: :center
  save_pdf file: 'coin_tracker.pdf',
           width: '8.5in',
           height: '11in',
           crop_marks: false
end
