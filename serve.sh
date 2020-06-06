#!/bin/bash

PORT=${1:-4000}

if [[ ! -e .env ]]; then
  echo -e "\e[33mWarning: .env file not found - GitHub Metadata gem won't be able to authenticate\e[0m"
  echo
fi

# pipe everything (inc. stderr) through grep, to filter out annoying messages about
# the _sass folder...
bundle exec jekyll serve --host $(hostname -I) --port $PORT --safe 2>&1 | grep -v "Invalid theme folder: _sass"
