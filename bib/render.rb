require 'bibtex'

bibs = BibTeX.open('bib/pure.bib').to_citeproc

knownFields = [ "author", "title", "container-title", "issued", "publisher",      # used
                "id", "page", "issue", "type", "volume", "genre",                 # ignored
                "ISBN", "issn", "note", "DOI", "collection-title", "editor",
                "publisher-place", "keywords", "month_numeric"
              ]

printed = []

print '<dl class="dl-horizontal">'

for bib in bibs do

  # unless bib.key?('container-title') then
  #   next
  # end

  year = bib['issued']['date-parts'][0][0]
  if printed[year] then
    print "<p></p>"
    print "<dt></dt>"
  else
    print "<p></p>"
    print "<p></p>"
    print "<dt>#{year}</dt>"
    printed[year] = true
  end

  print "<dd>"
  print "<b>#{bib['title']}</b>"
  print "<br>"
  print bib['author'].map {|author| "#{author['given']} #{author['family']}" }
                     .join(", ")
                     .gsub("Ozgur", "Özgür")
                     .gsub("Akgun", "Akgün")
                     .gsub("{\\\"O}", "Ö")
                     .gsub("{\\\"u}", "ü")
                     .gsub("{", "")
                     .gsub("}", "")
                     .gsub("Özgür Akgün", "<u>Özgür Akgün</u>")
                     .gsub("Peter William Nightingale", "Peter Nightingale")
                     .gsub("Ian James Miguel", "Ian Miguel")
                     .gsub("Long Thanh Thai", "Long Thai")
                     .gsub("Adam David Barker", "Adam Barker")
                     .gsub("Graham Njal Cameron Kirby", "Graham Kirby")
                     .gsub("Thomas Stanley Dalton", "Tom Dalton")
                     .gsub("Christopher John Lloyd Dibben", "Chris Dibben")
                     .gsub("Christopher Anthony Jefferson", "Chris Jefferson")

  print "\n<br>"
  if bib.key?('container-title') and bib.key?('publisher') then
    print "#{bib['container-title']}, #{bib['publisher']}"
  elsif bib.key?('container-title') then
    print "#{bib['container-title']}"
  elsif bib.key?('publisher') then
    print "#{bib['publisher']}"
  end
  print "</dd>"
  print "\n\n"

  # for key, value in bib do
  #   unless knownFields.include? key then
  #     puts(" ====> #{key}: #{value}")
  #   end
  # end

end

puts "</dl>"
