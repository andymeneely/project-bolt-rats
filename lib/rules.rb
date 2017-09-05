require 'prawn'
require_relative 'markdown_to_pdfstyles'

rules_text = markdown_to_pdfstyles(File.read('docs/rules.md'))

Prawn::Document.generate("_output/rules_via_prawn.pdf",
                         page_size: [180, 252], # 2.5in x 3.5in
                         margin: 10,
                         print_scaling: :none
  ) do

  font "Times-Roman"
  font_size 8
  text rules_text, inline_format: true
end
