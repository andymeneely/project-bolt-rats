require 'squib'
require_relative './helpers'

data = Squib.xlsx(file: 'game.xlsx', sheet: 0)  do |col, item|
  newlineate(col, item)
end

File.open('deck.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: 14) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  text layout: :title, str: data.name
  text layout: :type, str: data.size.map { |s| "#{s} Creature"} , font_size: 28

  composition = data.fabric.zip(data.metal, data.oil).map do |f,m,o|
    str = ""
    str << "#{f}🏴 " unless f.to_i == 0
    str << "#{m}⚙️ " unless m.to_i == 0
    str << "#{o}💧 "  unless o.to_i == 0
    str
  end
  text layout: :tr, str: composition,
       font: 'Sans, Segoe UI Symbol, Dingbats Bold 28' , align: :right, x: 425, width: 325

  text layout: :barter, str: data.barter

  text layout: :barter, str: 'Barter', valign: :top

  text layout: :build, str: data.build
  text layout: :build, str: 'Build', valign: :top

  text layout: :battle, str: data.battle
  text layout: :battle, str: 'Battle', valign: :top

  save format: :png
  save format: :pdf, gap: 0, trim: 75, margin: '0.125in'

  save_pdf file: 'creatures.pdf'
end

data = Squib.xlsx(file: 'game.xlsx', sheet: 1)

Squib::Deck.new(cards: 2) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  svg file: %w(resources.svg items.svg)
  item_bonuses = data.recipe.zip(data.bonus).map do |r,b|
    "<span size='60000' rise='-10000'>▢</span><b>#{r}</b>. <i>#{b}</i>"
  end.join("\n\n")
  puts item_bonuses
  text range: 1, font: 'Archivo Narrow, Sans 29', markup: true,
       spacing: '-5',
       x: 75, y: 75, width: 625, ellipsize: false,
       str: item_bonuses
  save_pdf file: 'resources.pdf'
end
