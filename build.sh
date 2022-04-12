#!/bin/bash

set -o errexit
set -o nounset

# bibtex-clean < bib/google.bib > bib/google-clean.bib ; mv bib/google-clean.bib bib/google.bib
bibtex-clean < bib/pure.bib > bib/pure-clean.bib ; mv bib/pure-clean.bib bib/pure.bib
ruby bib/render.rb > _includes/bib.html

# bundle update # to update dependencies

bundle install
bundle exec jekyll build
bundle exec htmlproofer _site --assume-extension --check-html --disable-external
