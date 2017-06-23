require 'squib'

data = Squib.csv file: 'game.csv'

Squib::Deck.new(cards: 7) do
  use_layout file: ['fantasy.yml', 'layout.yml']
  background color: :white
  rect layout: :cut
  rect layout: :safe
  # require 'irb'; binding.irb
  text layout: :title, str: data.name
  text layout: :ur, str: data.size
  save format: :png
end
