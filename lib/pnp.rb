require 'squib'

puts "Building PNP version..."

Squib::Deck.new(width: 750 * 3, height: 1050 * 3, cards: 2) do
  background color: :white
  Dir['_output/creature_big_*.png'].to_a.sort.each.with_index do |f,i|
    png file: "../#{f}",
        x: 750 * (i % 3),
        y: 1050 * (i / 3),
        crop_x: 37.5, crop_y: 37.5, crop_width: '2.5in', crop_height: '3.5in',
        range: 0
  end
  Dir['_output/creature_small_*.png'].to_a.sort.each.with_index do |f,i|
    png file: "../#{f}",
        x: 750 * (i % 3),
        y: 1050 * (i / 3),
        crop_x: 37.5, crop_y: 37.5, crop_width: '2.5in', crop_height: '3.5in',
        range: 1
  end
  png file: "../_output/resource_00.png",
      x: 750,
      y: 1050 * 2,
      crop_x: 37.5, crop_y: 37.5, crop_width: '2.5in', crop_height: '3.5in',
      range: 0
  png file: "../_output/resource_01.png",
      x: 750 * 2,
      y: 1050 * 2,
      crop_x: 37.5, crop_y: 37.5, crop_width: '2.5in', crop_height: '3.5in',
      range: 0
  png file: "../_output/resource_02.png",
      x: 750 * 2,
      y: 1050 * 2,
      crop_x: 37.5, crop_y: 37.5, crop_width: '2.5in', crop_height: '3.5in',
      range: 1
  save_pdf file: 'pnp_letter.pdf', width: '8.5in', height: '11in'
  save_pdf file: 'pnp_a4.pdf',     width: '210mm', height: '297mm'
end
