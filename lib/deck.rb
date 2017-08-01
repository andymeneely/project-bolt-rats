require 'squib'
require_relative './helpers'
require_relative './version'

data = Squib.xlsx(file: 'data/game.xlsx', sheet: 0)  do |col, item|
  newlineate(col, item)
end

File.open('data/deck.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: 14) do
  use_layout file: 'layout.yml'
  background color: :white
  rect layout: :cut
  rect layout: :safe
  text layout: :title, str: data.name
  text layout: :type, str: data.size.map { |s| "#{s} Creature"} , font_size: 28

  composition = data.fabric.zip(data.metal, data.oil).map do |f,m,o|
    str = ""
    str << "#{m}⚙️ " unless m.to_i == 0
    str << "#{f}🏴 " unless f.to_i == 0
    str << "#{o}💧 "  unless o.to_i == 0
    str
  end
  text layout: :type_right, str: composition,
       font: 'Sans, Segoe UI Symbol Bold 32' , align: :right, x: 425, width: 325

  text layout: :barter, str: data.barter
  # text layout: :barter, str: 'Barter', valign: :top

  text layout: :build, str: data.build
  # text layout: :build, str: 'Build', valign: :top

  text layout: :battle, str: data.battle
  # text layout: :battle, str: 'Battle', valign: :top
  text layout: :version, str: BoltRats::VERSION

  save format: :png
  save_pdf gap: 0, trim: 37.5, file: 'creatures.pdf'
  save_png
end

data = Squib.xlsx(file: 'data/game.xlsx', sheet: 1)

File.open('data/tools.txt', 'w+') do |f|
  f.write data.recipe.zip(data.bonus).map { |r,b| "#{r}\n#{b}" }.
          join("\n\n")
end

Squib::Deck.new(cards: 3) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  svg file: %w(resources.svg items.svg boss.svg)
  item_bonuses = data.recipe.zip(data.bonus).map do |r,b|
    "<b>#{r}</b>. <i>#{b}</i> "
  end.join("\n \n")
  text range: 1, font: 'Archivo Narrow, Sans 32', markup: true,
       spacing: -8,
       x: 150, y: 75, width: 575, ellipsize: false,
       str: item_bonuses
  0.upto(6).each do |n|
    y = n * 125 + 85
    # y += 10 if n == 4 # Tape dispensor adjustment
    y -= 15 if n == 5 # Tote bag adjustment
    y -= 30 if n == 6 # Whacking plank adjustment
    rect x: 75, y: y, width: 65, height: 65,
         radius: 15, range: 1, stroke_width: 4
  end
  text str: '<b>Zeppelin:</b>  8 Metal, 6 Fabric, 4 Oil, 3 Duct Tape',
       font: 'Archivo Narrow, Sans 32', range: 1, markup: true,
       x: 75, y: 950, width: 675, ellipsize: false, align: :center
  save_pdf file: 'resources.pdf', trim: 37.5
end
