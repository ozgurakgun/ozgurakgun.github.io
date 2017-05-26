#!/bin/bash

set -o errexit
set -o nounset

ruby bib/render.rb > _includes/bib.html

bundle install
bundle exec jekyll build
