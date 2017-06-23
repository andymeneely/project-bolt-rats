require 'squib'

data = Squib.csv file: 'game.csv', encoding: 'UTF-8'

Squib::Deck.new(cards: 14) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  text layout: :title, str: data.name
  text layout: :type, str: data.size.map { |s| "#{s} Creature"} , font_size: 28

  composition = data.fabric.zip(data.metal, data.oil).map do |f,m,o|
    str = ""
    str << "#{f}x🏴  " unless f == 0
    str << "#{m}x⚙️ " unless m == 0
    str << "#{o}x💧 " unless o == 0
    str
  end
  text layout: :tr, str: composition,
       font: 'Sans, Segoe UI Symbol, Dingbats Bold 28' , align: :right, x: 425, width: 325

  text layout: :barter, str: data.barter
  text layout: :barter, str: 'Barter', valign: :top

  text layout: :befriend, str: data.befriend
  text layout: :befriend, str: 'Befriend', valign: :top

  text layout: :battle, str: data.battle
  text layout: :battle, str: 'Battle', valign: :top

  save format: :png
  save format: :pdf, gap: 0, trim: 37.5
end
