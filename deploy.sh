#!/bin/bash

set -e

hugo
rsync -avzc --delete public/ mjuric@research.majuric.org:/var/www/research.majuric.org/html/dirac
rm -rf public
