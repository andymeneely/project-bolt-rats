# process XLSX data and just replace %n with a newline
def newlineate(col, item)
  return nil if item.nil?
  item.to_s.gsub "%n", "\n"
end
