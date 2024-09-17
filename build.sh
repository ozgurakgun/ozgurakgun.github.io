#!/bin/bash

set -o errexit
set -o nounset

# bibtex-clean < bib/google.bib > bib/google-clean.bib ; mv bib/google-clean.bib bib/google.bib
bibtex-clean < bib/pure.bib > bib/pure-clean.bib ; mv bib/pure-clean.bib bib/pure.bib
ruby bib/render.rb > _includes/bib.html

# had to do:
# brew install rbenv
# brew install ruby-build
# eval "$(rbenv init -)"
# rbenv install 3.1.2
# rbenv global 3.1.2

# bundle config set --local path 'vendor/bundle'

# bundle update # to update Gemfile.lock

bundle install
bundle exec jekyll build
bundle exec htmlproofer _site --assume-extension --check-html --disable-external
