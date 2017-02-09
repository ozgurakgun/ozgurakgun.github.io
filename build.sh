#!/bin/bash

set -o errexit
set -o nounset

bundle install
bundle exec jekyll build
