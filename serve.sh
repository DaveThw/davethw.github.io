#!/bin/bash

PORT=${1:-4000}

if [[ ! -e .env ]]; then
  echo -e "\e[33mWarning: .env file not found - GitHub Metadata gem won't be able to authenticate\e[0m"
  cat <<- EOF

	.env should contain somthing like:
	# GitHub Access Token for Jekyll (for github-metadata)
	JEKYLL_GITHUB_TOKEN=<Access Token from GitHub>

	To create an Access Token, see:
	https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

EOF
fi

# pipe everything (inc. stderr) through grep, to filter out annoying messages about
# the _sass folder...
bundle exec jekyll serve --host $(hostname -I) --port $PORT --safe 2>&1 | grep -v "Invalid theme folder: _sass"
