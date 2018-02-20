#!/bin/bash

set -o errexit
set -o nounset

ruby bib/render.rb > _includes/bib.html

bundle install
bundle exec jekyll build
bundle exec htmlproofer _site --assume-extension --check-html --disable-external
