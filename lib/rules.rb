require 'prawn'
require_relative 'markdown_to_pdfstyles'
require_relative 'version'

rules_text = markdown_to_pdfstyles(File.read('docs/rules.md'))
rules_text << "\nVersion #{BoltRats::VERSION}"

Prawn::Document.generate("_output/rules_via_prawn.pdf",
                         margin: 10,
                         print_scaling: :none
  ) do
  font "Times-Roman"
  font_size 8
  3.downto(1).each do |row|
    0.upto(2).each do |col|
      bounding_box([col * 180, row * 252 + 20], width: 180, height: 252) do
        transparent(0.5) { stroke_bounds }
        bounding_box([10, cursor - 10], :width => 160) do
          excess = text_box rules_text,
                              width: 160,
                              height: 232,
                              overflow: :truncate,
                              indent: 10,
                              inline_format: true
          rules_text = excess.inject('') { |str,h| str << h[:text]; str }
          puts rules_text
        end
      end
    end
  end

end
