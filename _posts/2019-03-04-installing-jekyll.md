---
title: "Installing Jekyll on a Raspberry Pi"
categories: Website
tags: Jekyll GitHub GitHub-Pages RaspberryPi
excerpt: Step-by-step through installing Jekyll, for local GitHub Pages, on a Raspberry Pi
date: 2019-03-04 10:00
updated: 2019-03-04 20:35
---

Mainly following (some of) the steps from [Setting up your GitHub Pages site locally with Jekyll](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll):

## Install Ruby

Check which version of Ruby is installed:
```shell
~/websites $ ruby --version
ruby 2.1.5p273 (2014-11-13) [arm-linux-gnueabihf]
~/websites $ which ruby
/usr/bin/ruby
```

The GitHub guide above says that you need Ruby 2.1.0 or higher installed, but it seems that you need at least 2.3 to install one (or more) of the dependancies of the `github-pages` gem.  The latest version which seems to be avilable via `apt` on Raspbian Jessie (as of March 2019) is 2.1.5.  I was able to install 2.3.1 on my Chromebook via Crouton, but the `bundle install` command (later on) failed on `Installing commonmarker 0.17.13 with native extensions`.  So in the end I installed Ruby 2.6 using [this gist, by blacktm](https://gist.github.com/blacktm/8302741) (2.6 seems to be the [latest version](https://www.ruby-lang.org/en/downloads/) at the moment):

```shell
~/websites $ wget https://gist.githubusercontent.com/blacktm/8302741/raw/installuby_rpi.sh
~/websites $ bash install_ruby_rpi.sh
```
*(which took about 34 mins on my Raspberry Pi 2)*

Then:
```shell
~/websites $ source ~/.bashrc
~/websites $ which ruby
/home/pi/.rbenv/shims/ruby
~/websites $ ruby --version
ruby 2.6.1p33 (2019-01-30 revision 66950) [armv7l-linux-eabihf]
```

## Install Bundler

Back to the [GitHub guide](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll#requirements) - next step is to install `bundler`:
```shell
~/websites $ gem install bundler
```
*(took about 10s!)*

## Set up local repository

Next we need to set up a local repository to work from - if you already have a (basic) website repository on GitHub, then:
```shell
~/websites $ git clone https://github.com/DaveThw/davethw.github.io.git
```

If the repository doesn't yet have a `Gemfile`, then create one in the root directory containing:
```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```

## Install Jekyll and other dependencies

Install Jekyll and other dependencies from the GitHub Pages gem:
```shell
~/websites/davethw.github.io $ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...............................................
Fetching concurrent-ruby 1.1.4
Installing concurrent-ruby 1.1.4

.....

Fetching github-pages 197
Installing github-pages 197
Bundle complete! 1 Gemfile dependency, 85 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Post-install message from dnsruby:
Installing dnsruby...
  For issues and source code: https://github.com/alexdalitz/dnsruby
  For general discussion (please tell us how you use dnsruby): https://groups.google.com/forum/#!forum/dnsruby
Post-install message from sass:

Ruby Sass is deprecated and will be unmaintained as of 26 March 2019.

* If you use Sass as a command-line tool, we recommend using Dart Sass, the new
  primary implementation: https://sass-lang.com/install

* If you use Sass as a plug-in for a Ruby web framework, we recommend using the
  sassc gem: https://github.com/sass/sassc-ruby#readme

* For more details, please refer to the Sass blog:
  http://sass.logdown.com/posts/7081811

Post-install message from html-pipeline:
-------------------------------------------------
Thank you for installing html-pipeline!
You must bundle Filter gem dependencies.
See html-pipeline README.md for more details.
https://github.com/jch/html-pipeline#dependencies
-------------------------------------------------
```
*(took about 19 mins)*

## Run Jekyll

Now you should be able to run your Jekyll site locally with:
```shell
~/websites/davethw.github.io $ bundle exec jekyll serve
```
However: this will only be available on the local computer - the Raspberry Pi in this case.  If you want Jekyll to serve the webpage to other computers/mobile phones/devices on the network, [this post](https://zarino.co.uk/post/jekyll-local-network/#solution-tell-jekyll-which-hostname-to-respond-to) told me about the [Jekyll serve command options](https://jekyllrb.com/docs/configuration/options/#serve-command-options) - in particular, setting `--host 0.0.0.0` will serve the Jekyll site on all available IP addresses for the machine.  So:
```shell
~/websites/davethw.github.io $ bundle exec jekyll serve --host 0.0.0.0
```
~~Seems to work nicely, magic!~~

-----

## Run Jekyll better

...Actually, it doesn't always work totally nicely - if your Jekyll site makes use of the `site.url` variable or the `absolute_url` filter, then it'll look weird - Jekyll is running (by default) in a development environment, so is replacing `site.url` (from \_config.yml) with \<host>:\<port> from the command line / config file (see the [Jekyll docs about the site.url variable](https://jekyllrb.com/docs/variables/#site-variables) and [the absolute_url filter](https://jekyllrb.com/docs/liquid/filters/) and [this issue on minimal-mistakes](https://github.com/mmistakes/minimal-mistakes/issues/1588)).  Therefore any links using either `site.url` or `absolute_url` (including any pointing to resources like css and js files) will be targetting http(s)://0.0.0.0:4000/... - which doesn't work from a remote device!..

(Note: If you try to get around this by telling Jekyll that it's running in a production environment, then it'll use the `site.url` value given in the \_config.yml file, so your local site will link to the 'live' version on the internet...)

Therefore your options seem to be: Either to run Jekyll with something like:
```shell
~/websites/davethw.github.io $ bundle exec jekyll serve --host 192.168.1.70
```
Or set up a 'development' config file, as suggested as [a solution to the issue on minimal-mistakes](https://github.com/mmistakes/minimal-mistakes/issues/1588#issuecomment-373937514), and pass that to Jekyll on the command line (see also the info box at the bottom of the [Jekyll page about environments](https://jekyllrb.com/docs/configuration/environments/), and/or the [Jekyll Build Command options list](https://jekyllrb.com/docs/configuration/options/#build-command-options) (note: `jekyll serve` [can accept any of the](https://jekyllrb.com/docs/configuration/options/#serve-command-options) `build` options)).

-----

## Keeping up-to-date

See the [GitHub guide, here](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll#keeping-your-site-up-to-date-with-the-github-pages-gem), but basically you need to periodically do:
```shell
~/websites/davethw.github.io $ bundle update
```
