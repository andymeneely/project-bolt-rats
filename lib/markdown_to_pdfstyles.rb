# This function translates MarkDown to PDF inline styles.
#
# markdown_to_pdfstyles("plaintext") #=> "plaintext"
# markdown_to_pdfstyles("**bold only**") #=> "<b>bold only</b>"
# markdown_to_pdfstyles("_italics only_") #=> "<i>italics only</i>"
# markdown_to_pdfstyles("`code only`") #=> "<code>code only</code>"
# markdown_to_pdfstyles("    code by indentation") #=> "<code>code by indentation</code>"
# markdown_to_pdfstyles("> To be or not to be\n\n") #=> "<q> To be or not to be</q>"
# markdown_to_pdfstyles(35.chr + "Title\n") #=> "<h1>Title</h1>"
# markdown_to_pdfstyles("\npara\n") #=> "\n<p>para</p>\n"
# markdown_to_pdfstyles("[foo](http://foo.com)") #=> "<a href=\"http://foo.com\">foo</a>"
def markdown_to_pdfstyles(text)
  text
    .gsub(anything_inside("**"))      {|txt| "<b>#{txt.tr("**","")}</b>"}
    .gsub(anything_inside("_"))       {|txt| "<i>#{txt.tr("_","")}</i>"}
    .gsub(anything_inside("#", "\n")) {|txt| "<font size='12' name='Helvetica'><b>#{txt.sub(/^\#*/,"")}</b></font>"}
    # .gsub(/\#(.*)\n/) {|txt|}
    # .gsub(anything_inside("`"))  {|txt| "<code>#{txt.tr("`","")}</code>"}
    # .gsub(anything_inside("\n")) {|txt| "\n<p>#{txt.tr("\n","")}</p>\n"}
    # .gsub(/\ \ \ \ .*/) {|txt| "<code>#{txt.strip}</code>"}
end

# Returns a Regex that matches anything inside the delimiter.
# The given delimiter is escaped to allow the use of special characters.
#
# anything_inside("**") #=> /\*\*.*\*\*/
def anything_inside(start, ending=nil)
  start = "\\" + start.chars.join("\\")
  ending = start if ending == nil
  Regexp.new(start + ".*" + ending)
end
