require 'bibtex'

contents = File.read('bib/pure.bib').gsub('{\"O}zg{\"u}r', 'Özgür')
                                    .gsub('Akg{\"u}n', 'Akgün')
                                    
bibs = BibTeX.parse(contents).to_citeproc

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

  title = bib['title'].gsub("ESSENCE", "Essence").gsub("CONJURE", "Conjure")

  filename = title.gsub(":", " -")
  filename = "files/fulltext/#{year}/#{filename}.pdf"

  print "<dd>\n"
  print "<b>#{title}</b>\n"
  if File.exist?(filename) then
    print "(<a href=\"/#{filename}\">pdf</a>)\n"
  end
  print "<br>\n"
  print bib['author'].map {|author| "#{author['given']} #{author['family']}" }
                     .join(", ")
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
                     .gsub("G\\\"okberk Ko\\c cak", "Gökberk Koçak")
                     .gsub("Gokberk Kocak", "Gökberk Koçak")

  print "\n"
  parts = []
  if bib.key?('container-title') then
    parts.push(bib['container-title'])
  end
  if bib.key?('publisher') then
    parts.push(bib['publisher'])
  end
  # Render the note if the venue is otherwise unknown
  if parts.empty? then
    if bib.key?('note') then
      parts.push(bib['note'])
    end
  end
  unless parts.empty? then
    print "<br>"
    print parts.join(", ").gsub("&", "&amp;")
  end

  if bib.key?('DOI') then
    print "\n<br>"
    print "DOI: <a href=\"https://doi.org/#{bib['DOI']}\">#{bib['DOI']}</a>"
  end
  if bib.key?('ISBN') then
    print "\n<br>"
    print "ISBN: <a href=\"http://www.ottobib.com/isbn/#{bib['ISBN']}\">#{bib['ISBN']}</a>"
  end
  if bib.key?('URL') then
    print "\n<br>"
    face = bib['URL']
    if face.length > 120 then
      face = bib['URL'].chars.first(30).join + "...." + bib['URL'].chars.last(30).join
    end
    print "URL: <a href=\"#{bib['URL']}\">#{face}</a>"
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
