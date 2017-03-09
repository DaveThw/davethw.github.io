---
title: "Updating minimal-mistakes"
categories: Website
# tags: 
excerpt: Step-by-step through updating minimal-mistakes from GitHub
---

Following steps from the [Upgrading guide](https://mmistakes.github.io/minimal-mistakes/docs/upgrading/#use-git):

Initally I just downloaded a zip of minimal-mistakes, rather than forking it, so:
```shell
~/.../blog/davethw.github.io $ git remote -v
origin  https://github.com/DaveThw/davethw.github.io.git (fetch)
origin  https://github.com/DaveThw/davethw.github.io.git (push)
~/.../blog/davethw.github.io $ git remote add upstream https://github.com/mmistakes/minimal-mistakes.git
~/.../blog/davethw.github.io $ git remote -v
origin  https://github.com/DaveThw/davethw.github.io.git (fetch)
origin  https://github.com/DaveThw/davethw.github.io.git (push)
upstream        https://github.com/mmistakes/minimal-mistakes.git (fetch)
upstream        https://github.com/mmistakes/minimal-mistakes.git (push)
```

Next, pull down updates from upstream:
```shell
~/.../blog/davethw.github.io $ git pull upstream master
From https://github.com/mmistakes/minimal-mistakes
 * branch            master     -> FETCH_HEAD
Auto-merging _includes/breadcrumbs.html
CONFLICT (add/add): Merge conflict in _includes/breadcrumbs.html
Auto-merging _data/navigation.yml
CONFLICT (add/add): Merge conflict in _data/navigation.yml
Auto-merging _config.yml
CONFLICT (add/add): Merge conflict in _config.yml
Auto-merging Gemfile
CONFLICT (add/add): Merge conflict in Gemfile
Auto-merging .gitignore
CONFLICT (add/add): Merge conflict in .gitignore
Automatic merge failed; fix conflicts and then commit the result.
```

Hmmm.. how do I "work through any conflicting files Git flags, staging the changes you wish to keep, and then commit them"..?
```shell
~/.../blog/davethw.github.io $ git status
# On branch master
# Changes to be committed:
#
#       new file:   .editorconfig
#       new file:   .gitattributes
#       new file:   .github/CONTRIBUTING.md
#       new file:   .github/ISSUE_TEMPLATE.md
#       new file:   CHANGELOG.md
#       new file:   README.md
#       new file:   docs/Gemfile
#       new file:   docs/_config.dev.yml
#       new file:   docs/_config.yml
#       new file:   docs/_data/authors.yml
#       new file:   docs/_data/comments/chocolate-chip-cookies/comment-1473870213530.yml
#       new file:   docs/_data/comments/chocolate-chip-cookies/comment-1478213467992.yml
#       new file:   docs/_data/comments/gemified-theme-beta/comment-1479508047505.yml
#       new file:   docs/_data/comments/gemified-theme-beta/comment-1480591890264.yml
#       new file:   docs/_data/comments/gemified-theme-beta/comment-1482532165381.yml
# ......
#       new file:   docs/assets/js/plugins/jquery.magnific-popup.js
#       new file:   docs/assets/js/plugins/jquery.smooth-scroll.min.js
#       new file:   docs/assets/js/vendor/jquery/jquery-1.12.4.min.js
#       new file:   docs/screenshot-layouts.png
#       new file:   docs/screenshot.png
#       new file:   minimal-mistakes-jekyll.gemspec
#       new file:   screenshot-layouts.png
#       new file:   screenshot.png
#       new file:   test/Gemfile
#       new file:   test/_config.yml
#       new file:   test/_data/authors.yml
#       new file:   test/_data/navigation.yml
#       new file:   test/_data/ui-text.yml
#       new file:   test/_pages/404.md
#
#       new file:   test/assets/images/unsplash-image-6.jpg
#       new file:   test/assets/images/unsplash-image-7.jpg
#       new file:   test/assets/images/unsplash-image-8.jpg
#       new file:   test/assets/images/unsplash-image-9.jpg
#       new file:   test/index.html
# ......
# Unmerged paths:
#   (use "git add/rm <file>..." as appropriate to mark resolution)
#
#       both added:         .gitignore
#       both added:         Gemfile
#       both added:         _config.yml
#       both added:         _data/navigation.yml
#       both added:         _includes/breadcrumbs.html
#
```

Not quite sure what to do, but this seems to work (based on [this answer on stackoverflow](http://stackoverflow.com/questions/161813/how-to-resolve-merge-conflicts-in-git#answer-3407920)):
```shell
~/.../blog/davethw.github.io $ git checkout --ours .gitignore
~/.../blog/davethw.github.io $ cat .gitignore
_site
.sass-cache
.jekyll-metadata
Gemfile.lock
~/.../blog/davethw.github.io $ git checkout --theirs .gitignore
~/.../blog/davethw.github.io $ cat .gitignore
*.gem
*.sublime-project
*.sublime-workspace
.bundle
.DS_Store
.jekyll-metadata
.sass-cache
_asset_bundler_cache
_site
codekit-config.json
example/_site
Gemfile.lock
node_modules
npm-debug.log*~/.../blog/davethw.github.io $ 
~/.../blog/davethw.github.io $ git add .gitignore
```

And so on, for all the files listed under `Unmerged paths`

Also, I removed the `docs/` and `test/` directories...

```shell
~/.../blog/davethw.github.io $ rm -r docs/
~/.../blog/davethw.github.io $ git rm docs/
fatal: not removing 'docs/' recursively without -r
~/.../blog/davethw.github.io $ git rm -r docs/
rm 'docs/Gemfile'
rm 'docs/_config.dev.yml'
rm 'docs/_config.yml'
rm 'docs/_data/authors.yml'
.....
rm 'docs/assets/js/plugins/jquery.smooth-scroll.min.js'
rm 'docs/assets/js/vendor/jquery/jquery-1.12.4.min.js'
rm 'docs/screenshot-layouts.png'
rm 'docs/screenshot.png'
~/.../blog/davethw.github.io $ git rm -r test/
rm 'test/Gemfile'
rm 'test/_config.yml'
rm 'test/_data/authors.yml'
rm 'test/_data/navigation.yml'
rm 'test/_data/ui-text.yml'
.....
rm 'test/assets/images/unsplash-image-6.jpg'
rm 'test/assets/images/unsplash-image-7.jpg'
rm 'test/assets/images/unsplash-image-8.jpg'
rm 'test/assets/images/unsplash-image-9.jpg'
rm 'test/index.html'
```

Once all done and tidied up, commit and push to GitHub:
```shell
~/.../blog/davethw.github.io $ git status
# On branch master
# Changes to be committed:
#
#       new file:   .editorconfig
#       new file:   .gitattributes
#       new file:   .github/CONTRIBUTING.md
#       new file:   .github/ISSUE_TEMPLATE.md
#       modified:   .gitignore
#       new file:   CHANGELOG.md
#       new file:   README.md
#       new file:   minimal-mistakes-jekyll.gemspec
#       new file:   screenshot-layouts.png
#       new file:   screenshot.png
#
~/.../blog/davethw.github.io $ git commit -m "Update to minimal-mistakes release/4.3.0"
[master f8fd50c] Update to minimal-mistakes release/4.3.0
~/.../blog/davethw.github.io $ git push
Username for 'https://github.com': DaveThw
Password for 'https://DaveThw@github.com': 
To https://github.com/DaveThw/davethw.github.io.git
   46eab5e..f8fd50c  master -> master
```