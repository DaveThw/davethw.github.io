---
title: "Upgrading minimal-mistakes (again)"
categories: Guides
tags: git GitHub minimal-mistakes Website
excerpt: Step-by-step through upgrading minimal-mistakes from GitHub (now using v.4.4.1)
date: 2017-05-09 21:00
redirect_from: /website/upgrading-minimal-mistakes-again.html
---

Following steps from the [Upgrading guide](https://mmistakes.github.io/minimal-mistakes/docs/upgrading/#use-git):


Pull down updates from upstream:
```shell
~/.../blog/davethw.github.io$ git pull upstream master
remote: Counting objects: 310, done.
remote: Total 310 (delta 173), reused 173 (delta 173), pack-reused 137
Receiving objects: 100% (310/310), 99.01 KiB, done.
Resolving deltas: 100% (224/224), completed with 76 local objects.
From https://github.com/mmistakes/minimal-mistakes
 * branch            master     -> FETCH_HEAD
CONFLICT (modify/delete): test/_posts/2013-08-16-markup-syntax-highlighting.md deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of test/_posts/2013-08-16-markup-syntax-highlighting.md left in tree.
CONFLICT (modify/delete): test/_posts/2012-03-15-layout-header-overlay-image.md deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of test/_posts/2012-03-15-layout-header-overlay-image.md left in tree.
CONFLICT (modify/delete): test/_posts/2010-01-07-post-modified.md deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of test/_posts/2010-01-07-post-modified.md left in tree.
CONFLICT (modify/delete): test/_pages/terms.md deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of test/_pages/terms.md left in tree.
CONFLICT (modify/delete): docs/assets/js/plugins/jquery.greedy-navigation.js deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of docs/assets/js/plugins/jquery.greedy-navigation.js left in tree.
CONFLICT (modify/delete): docs/assets/js/main.min.js deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of docs/assets/js/main.min.js left in tree.
.....
CONFLICT (modify/delete): docs/_data/ui-text.yml deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of docs/_data/ui-text.yml left in tree.
CONFLICT (modify/delete): docs/_data/navigation.yml deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of docs/_data/navigation.yml left in tree.
Auto-merging _sass/minimal-mistakes/_utilities.scss
Auto-merging _sass/minimal-mistakes/_page.scss
CONFLICT (modify/delete): _sass/_print.scss deleted in 55c4f91b8e46ec9874fa13aa10b7340647aa0205 and modified in HEAD. Version HEAD of _sass/_print.scss left in tree.
Auto-merging _layouts/single.html
CONFLICT (content): Merge conflict in _layouts/single.html
Auto-merging _data/ui-text.yml
CONFLICT (modify/delete): README.md deleted in HEAD and modified in 55c4f91b8e46ec9874fa13aa10b7340647aa0205. Version 55c4f91b8e46ec9874fa13aa10b7340647aa0205 of README.md left in tree.
Automatic merge failed; fix conflicts and then commit the result.
```

So... it looks like git is a little upset that I deleted the `test/` and `docs/` folders, and then files in those folders have been modified in the master.  So I decided to sweep the issue under the carpet, so to speak, and tell git to remove those directories once again!..

```shell
~/.../blog/davethw.github.io$ git rm -r docs/
docs/_data/navigation.yml: needs merge
docs/_data/ui-text.yml: needs merge
docs/_docs/01-quick-start-guide.md: needs merge
.....
docs/_sass/minimal-mistakes/vendor/susy/susy/su/_validation.scss: needs merge
docs/assets/css/main.scss: needs merge
docs/assets/js/main.min.js: needs merge
docs/assets/js/plugins/jquery.greedy-navigation.js: needs merge
error: 'docs/_data/comments/layout-sidebar-nav-list/comment-1492811460488.yml' has changes staged in the index
(use --cached to keep the file, or -f to force removal)
error: 'docs/_data/comments/layout-sidebar-nav-list/comment-1492812977693.yml' has changes staged in the index
(use --cached to keep the file, or -f to force removal)
error: 'docs/_sass/minimal-mistakes.scss' has changes staged in the index
(use --cached to keep the file, or -f to force removal)
error: 'docs/_sass/minimal-mistakes/_print.scss' has changes staged in the index
(use --cached to keep the file, or -f to force removal)
```

I think this is git's way of saying it doesn't want to remove those files, because there have been changes and it doesn't quite know what to do.  So I deleted the directory myself and tried again...

```shell
~/.../blog/davethw.github.io$ rm -r docs/
~/.../blog/davethw.github.io$ git rm -r docs/
docs/_data/navigation.yml: needs merge
docs/_data/ui-text.yml: needs merge
docs/_docs/01-quick-start-guide.md: needs merge
.....
docs/_sass/minimal-mistakes/vendor/susy/susy/su/_utilities.scss: needs merge
docs/_sass/minimal-mistakes/vendor/susy/susy/su/_validation.scss: needs merge
docs/assets/css/main.scss: needs merge
docs/assets/js/main.min.js: needs merge
docs/assets/js/plugins/jquery.greedy-navigation.js: needs merge
rm 'docs/_data/comments/layout-sidebar-nav-list/comment-1492811460488.yml'
rm 'docs/_data/comments/layout-sidebar-nav-list/comment-1492812977693.yml'
rm 'docs/_data/navigation.yml'
....
rm 'docs/_sass/minimal-mistakes/vendor/susy/susy/su/_utilities.scss'
rm 'docs/_sass/minimal-mistakes/vendor/susy/susy/su/_validation.scss'
rm 'docs/assets/css/main.scss'
rm 'docs/assets/css/main.scss'
rm 'docs/assets/js/main.min.js'
rm 'docs/assets/js/main.min.js'
rm 'docs/assets/js/plugins/jquery.greedy-navigation.js'
rm 'docs/assets/js/plugins/jquery.greedy-navigation.js'
```

That seems to have worked (not sure why some files seem to have been `rm`-d twice..?).  Similar process done for `test/` directory.

```shell
~/.../blog/davethw.github.io$ git status
# On branch master
# Changes to be committed:
#
#       modified:   .github/CONTRIBUTING.md
#       modified:   .github/ISSUE_TEMPLATE.md
#       modified:   CHANGELOG.md
#       modified:   LICENSE.txt
#       modified:   _data/ui-text.yml
#       modified:   _includes/video
#       modified:   _layouts/default.html
#       modified:   _layouts/splash.html
#       new file:   _sass/minimal-mistakes.scss
#       renamed:    _sass/_animations.scss -> _sass/minimal-mistakes/_animations.scss
#       renamed:    _sass/_archive.scss -> _sass/minimal-mistakes/_archive.scss
.....
#       renamed:    _sass/_notices.scss -> _sass/minimal-mistakes/_notices.scss
#       renamed:    _sass/_page.scss -> _sass/minimal-mistakes/_page.scss
#       new file:   _sass/minimal-mistakes/_print.scss
#       renamed:    _sass/_reset.scss -> _sass/minimal-mistakes/_reset.scss
#       renamed:    _sass/_sidebar.scss -> _sass/minimal-mistakes/_sidebar.scss
#       renamed:    _sass/_syntax.scss -> _sass/minimal-mistakes/_syntax.scss
.....
#       renamed:    _sass/vendor/susy/susy/su/_utilities.scss -> _sass/minimal-mistakes/vendor/susy/susy/su/_utilities.scss
#       renamed:    _sass/vendor/susy/susy/su/_validation.scss -> _sass/minimal-mistakes/vendor/susy/susy/su/_validation.scss
#       modified:   assets/css/main.scss
#       modified:   assets/js/main.min.js
#       modified:   assets/js/plugins/jquery.greedy-navigation.js
#       modified:   minimal-mistakes-jekyll.gemspec
#       modified:   package.json
#
# Unmerged paths:
#   (use "git add/rm <file>..." as appropriate to mark resolution)
#
#       deleted by us:      README.md
#       both modified:      _layouts/single.html
#       deleted by them:    _sass/_print.scss
#
```

So...  This looks like git telling us that a few files have been changed, and a whole lot have moved, and then there are three remaining conflicts(?) that we need to deal with listed at the end.
1. I don't want the minimal mistakes `README.md` (probably ought to make my own at some point...), so that's easy to fix.
2. I've changed `_layouts/single.html` (to show both original date and updated date), and minimal mistakes has made a change in the same part of the file (swapping from using page.last_modified_at instead of page.modified), so that needs resolving.
3. I've made some changes to `_sass/_print.scss`, which hasn't actually been deleted but has moved to `_sass/minimal-mistakes/_print.scss` (which git thinks is a new file) - and minimal mistakes has also make some significant changes to the file.  I'm happy to just use the new minimal mistakes version (although I might tweak it a bit later...), so can tell git to remove my old version.

```shell
~/.../blog/davethw.github.io$ git rm README.md 
README.md: needs merge
rm 'README.md'
~/.../blog/davethw.github.io$ git rm _sass/_print.scss
_sass/_print.scss: needs merge
rm '_sass/_print.scss'
```

I opened `_layouts/single.html` in a text editor and found (and resolved!) the merge conflict as described on [GitHub Help, here](https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/).  Then:

```shell
~/.../blog/davethw.github.io$ git add _layouts/single.html
```

Finally, commit and push back to GitHub:

```shell
~/.../blog/davethw.github.io$ git status
# On branch master
# Changes to be committed:
#
#       modified:   .github/CONTRIBUTING.md
#       modified:   .github/ISSUE_TEMPLATE.md
#       modified:   CHANGELOG.md
#       modified:   LICENSE.txt
#       modified:   _data/ui-text.yml
#       modified:   _includes/video
#       modified:   _layouts/default.html
#       modified:   _layouts/single.html
#       modified:   _layouts/splash.html
#       deleted:    _sass/_print.scss
#       new file:   _sass/minimal-mistakes.scss
#       renamed:    _sass/_animations.scss -> _sass/minimal-mistakes/_animations.scss
.....
#       renamed:    _sass/vendor/susy/susy/su/_utilities.scss -> _sass/minimal-mistakes/vendor/susy/susy/su/_utilities.scss
#       renamed:    _sass/vendor/susy/susy/su/_validation.scss -> _sass/minimal-mistakes/vendor/susy/susy/su/_validation.scss
#       modified:   assets/css/main.scss
#       modified:   assets/js/main.min.js
#       modified:   assets/js/plugins/jquery.greedy-navigation.js
#       modified:   minimal-mistakes-jekyll.gemspec
#       modified:   package.json
#
~/.../blog/davethw.github.io$ git commit -m "Update Minimal Mistakes to latest master (v.4.4.1, plus a couple of more recent changes)"
[master a030898] Update Minimal Mistakes to latest master (v.4.4.1, plus a couple of more recent changes)
~/.../blog/davethw.github.io$ git push
Username for 'https://github.com': DaveThw
Password for 'https://DaveThw@github.com': 
To https://github.com/DaveThw/davethw.github.io.git
   8d500f6..805a951  master -> master
~/.../blog/davethw.github.io$ git status
# On branch master
nothing to commit (working directory clean)
```

--------

For the next time, it might be good to not have to delete `docs/` and `test/` and so on...  I could just leave them there and quietly ignore them - or could I add them to the `.gitignore` file?  What would that do..?
