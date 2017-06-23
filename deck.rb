require 'squib'

data = Squib.csv file: 'game.csv'

Squib::Deck.new(cards: 14) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  text layout: :title, str: data.name
  text layout: :type, str: data.size.map { |s| "#{s} Creature"} , font_size: 20

  composition = data.fabric.zip(data.metal, data.oil).map do |f,m,o|
    str = ""
    str << "#{f}F " unless f == 0
    str << "#{m}M " unless m == 0
    str << "#{o}O " unless o == 0
    str
  end
  text layout: :tr, font_size: 20, str: composition, align: :right



  save format: :png
end
