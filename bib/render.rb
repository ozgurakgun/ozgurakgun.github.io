require 'bibtex'

bibs = BibTeX.open('bib/pure.bib').to_citeproc

knownFields = [ "author", "title", "container-title", "issued", "publisher",      # used
                "id", "page", "issue", "type", "volume", "genre",                 # ignored
                "ISBN", "issn", "note", "DOI", "collection-title", "editor",
                "publisher-place", "keywords", "month_numeric"
              ]

printed = []

print '<dl class="dl-horizontal">'
print "\n\n"

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
    print "<hr>"
    print "<dt>#{year}</dt>"
    printed[year] = true
  end
  print "\n"

  print "<dd>"
  print "<b>#{bib['title']}</b>".gsub("ESSENCE", "Essence").gsub("CONJURE", "Conjure")
  print "<br>"
  print bib['author'].map {|author| "#{author['given']} #{author['family']}" }
                     .join(", ")
                     .gsub("{\\\"O}", "Ö")
                     .gsub("{\\\"u}", "ü")
                     .gsub("Ozgur", "Özgür")
                     .gsub("Akgun", "Akgün")
                     .gsub("{", "")
                     .gsub("}", "")
                     .gsub("Özgür Akgün", "<u>Özgür Akgün</u>")
                     .gsub("Peter William Nightingale", "Peter Nightingale")
                     .gsub("James Patrick Wetter", "James Wetter")
                     .gsub("Ian James Miguel", "Ian Miguel")
                     .gsub("Long Thanh Thai", "Long Thai")
                     .gsub("Adam David Barker", "Adam Barker")
                     .gsub("Graham Njal Cameron Kirby", "Graham Kirby")
                     .gsub("Thomas Stanley Dalton", "Tom Dalton")
                     .gsub("Christopher John Lloyd Dibben", "Chris Dibben")
                     .gsub("Christopher Anthony Jefferson", "Chris Jefferson")
                     .gsub("Ian P. Gent", "Ian Gent")
                     .gsub("Ian Philip Gent", "Ian Gent")
                     .gsub("Saad Wasim A Attieh", "Saad Attieh")
                     .gsub("Andr\\\'as Z. Salamon", "András Z. Salamon")
                     .gsub("Lee Emma Palmer Williamson", "Lee Williamson")

  print "\n"
  parts = []
  if bib.key?('container-title') then
    parts.push(bib['container-title'].gsub("&", "&amp;"))
  end
  if bib.key?('publisher') then
    parts.push(bib['publisher'].gsub("&", "&amp;"))
  end
  unless parts.empty? then
    print "<br>"
    print parts.join(", ")
  end

  if bib.key?('DOI') then
    print "\n<br>"
    print "<a href=\"https://doi.org/#{bib['DOI']}\">DOI: #{bib['DOI']}</a>"
  end
  if bib.key?('URL') then
    print "\n<br>"
    print "<a href=\"#{bib['URL']}\">URL: #{bib['URL']}</a>"
  end
  if bib.key?('ISBN') then
    print "\n<br>"
    print "<a href=\"http://www.ottobib.com/isbn/#{bib['ISBN']}\">ISBN: #{bib['ISBN']}</a>"
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
