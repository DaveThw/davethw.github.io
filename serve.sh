#!/bin/bash

PORT=${1:-4000}

# pipe everything (inc. stderr) through grep, to filter out annoying messages about
# the _sass folder...
bundle exec jekyll serve --host $(hostname -I) --port $PORT --safe 2>&1 | grep -v "Invalid theme folder: _sass"
