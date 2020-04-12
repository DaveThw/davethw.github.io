#!/bin/bash

PORT=${1:-4000}
bundle exec jekyll serve --host $(hostname -I) --port $PORT
