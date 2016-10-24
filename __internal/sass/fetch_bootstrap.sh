#!/bin/bash

set -o errexit
set -o nounset

# thanks to http://veithen.github.io/2015/03/26/jekyll-bootstrap.html

# pick a release from https://github.com/twbs/bootstrap-sass/releases
RELEASE="v3.3.6"

if [ -d bootstrap-sass ]; then
    ( cd bootstrap-sass ; git pull origin master )
else
    git clone https://github.com/twbs/bootstrap-sass.git
fi

( cd bootstrap-sass ; git checkout tags/"${RELEASE}" )

cp -r bootstrap-sass/assets/stylesheets/_bootstrap.scss bootstrap-sass/assets/stylesheets/bootstrap .

