#!/bin/bash

set -o errexit
set -o nounset

bundle exec jekyll build
