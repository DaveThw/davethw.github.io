---
# layout: post
title:  "Git Quick Reference"
categories: Programming
tags: git
excerpt: Various reminders of how to do things in git!
date: 2018-04-21 21:00
#modified: 2018-04-22 21:00
#modified: 2018-04-23 21:00
modified: 2018-04-29 21:00
---

## Setting up

#### Initialise a new project:
```shell
~ $ git init project
~ $ cd project
```
or
```shell
~ $ mkdir project
~ $ cd project
~/project $ git init
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository#_initializing_a_repository_in_an_existing_directory)


#### Clone a repo from GitHub (or elsewhere):
```shell
~ $ git clone https://github.com/User/project.git
```
*__Note:__ can also be done with SSH, or from elsewhere on local filesystem*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository#_git_cloning)


#### Set user details for git:
```shell
~/project $ git config --global user.email "you@example.com"
~/project $ git config --global user.name "Your Name"
```
*Omit* `--global` *to set the identity only in this repository.*
<br>*__Note:__ If you don't set these options, git will ask you to do so the first time you try to commit anything!*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_your_identity)


#### Tell git to cache (HTTPS) credentials:
```shell
~/project $ git config --global credential.helper cache
```
*Omit* `--global` *to set the credential helper only in this repository.*
*__Note:__ Defaults to caching your credentials for 15 minutes*
<br>Refs: [Git Reference](https://git-scm.com/docs/git-credential-cache#_examples) | [Git Pro](https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage#_credential_caching)


#### Check your settings:
```shell
~/project $ git config --list
~/project $ git config user.name
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_checking_your_settings)
<br>See also: [Git Configuration](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)


--------------------------------------------------------------------------------


## Basic use

#### Show status of project:
```shell
~/project $ git status
```
*This shows you which branch you are on and which files are ready to commit, unstaged yet, or untracked*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_checking_status)


#### Stage changes in file / directory ready for the next commit:
```shell
~/project $ git add <file|directory>
```
ie. this will add all changed files in the current directory:
```shell
~/project $ git add .
```
Refs: Git Pro - [Tracking new files](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_tracking_files) | [Staging modified files](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_staging_modified_files)


#### Remove a file:
```shell
~/project $ git rm file
```
*__Note:__ as well as removing the file from git's index of tracked files, this will also delete the file.*
<br>If you just want remove the file from version control, but not actually delete the file, use:
```shell
~/project $ git rm --cached file
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_removing_files)


#### Rename a file:
```shell
~/project $ git mv file_from file_to
```
*__Note:__ if you move a file manually, git should work out that you've moved it - although you'll have to run* `git rm file_from` *and* `git add file_to`*, so therefore* `git mv` *saves one or two commands!*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_git_mv)


#### Commit the staged files:
```shell
~/project $ git commit -m "<message - try to keep to less than 50 chars!..>"
```
*If you omit* `-m "message"` *then a text editor will launch with a default commit message - this gives you the chance to add more lines of detail after the main commit message (I think...)*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_committing_changes)


#### Commit all modified, tracked files, without needing to stage them first:
```shell
~/project $ git commit -a -m "<message>"
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_skipping_the_staging_area)


--------------------------------------------------------------------------------


## View Commit History

#### History for current branch:
```shell
~/project $ git log
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History)


#### Condense, graphed history:
```shell
~/project $ git log --oneline --graph --decorate
```
`--oneline` shows each commit on a single line
<br>`--graph` draws an ASCII graph of the branch and merge history
<br>`--decorate` add names of branches or tags to the commits shown
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History#log_options)


--------------------------------------------------------------------------------


## Remote Branches

See: [Git Pro: Git Branching - Remote Branches](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches)

#### List all remote repositoriy references:
```shell
~/project $ git remote show
```


#### Show details of remote repository:
```shell
~/project $ git remote show origin
```
*Change* `origin` *for the reference name of the remote repositiory!*
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#_remote_branches)


#### List local branches, with details of what remote branches they are tracking:
```shell
~/project $ git branch -vv
```


#### Fetch status and contents of remote branches (but don't merge with any local branches):
```shell
~/project $ git fetch origin
```


#### Merge a remote branch with the current local branch:
```shell
~/project $ git fetch origin
~/project $ git merge origin/remote-branch
```
or
```shell
~/project $ git pull origin remote-branch
```


#### Add an existing remote branch to local repository:
```shell
~/project $ git checkout -b new-branch origin/new-branch
```
or
```shell
~/project $ git checkout --track origin/new-branch
```
or
```shell
~/project $ git checkout new-branch
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#_tracking_branches)


#### Push a local branch up to a remote server (first time):
```shell
~/project $ git push origin new-branch
```
*__Note:__ you don't have to have* `new-branch` *currently checked out for this to work.*
<br>*This will push the named local branch up to the remote repository, and configure it to do so again, along with other branches, when you do a* `git push --all` *- but not to pull back with a* `git pull`.
<br>Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#_pushing_branches)


#### Push current local branch up to a remote server:
```shell
~/project $ git push
```
*This will push the current local branch up to its configured remote repository.*
<br>*If the current branch doesn't have a remote repository configured for pushing, it will push to* `origin` *(and configure it to do so again when you do a* `git push --all`*..?).*
<br>Ref: [Git Reference](https://git-scm.com/docs/git-push#git-push-codegitpushcode)

#### Push all local branches up to remote server:
```shell
~/project $ git push --all
```
*This will push all the local branches (that are configured to do so?) up to their respective remote repositories.*
<br>Ref: [Git Reference](https://git-scm.com/docs/git-push#git-push---all)

#### Set current local branch to track a remote branch:
```shell
~/project $ git branch --set-upstream-to origin/new-branch
```
or
```shell
~/project $ git branch -u origin/new-branch
```
*This will configure the current local branch to pull from the remote repository when you do a simple* `git pull`.


#### Pull branches from the remote server:
```shell
~/project $ git pull
```
*Exactly what this does depends somewhat on your repository and how things have been configured.*
- *If the current branch has been set to track a remote branch, then the default behaviour is to pull that remote branch from it's server and merge with the current branch - ie. it is equivalent to something like* `git fetch origin; git merge origin/this-branch`.
- *If the current branch isn't currently set to track a remote branch, then I think the* `FETCH_HEAD` *from the (default?* `origin`*?) remote repository is merged with the current branch, but I'm not sure (nor entirely certain what that means in relation to GitHub... it probably fetches and merges in the* `origin/master` *branch..?)*
- *It appears that by default, if the current branch doesn't have any tracking information, then* `git pull` *will throw an error and ask you to either specifiy which (remote) branch you wish to merge with, or set tracking information for the local branch (and tell you how!)*

*__Note:__ It isn't possible to pull multiple branches from their remote repositories with a single git command - [see here](https://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches)*
<br>Refs: [Git Reference](https://git-scm.com/docs/git-pull#_default_behaviour) | [Git Pro](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#_pulling)


#### Stop current branch from tracking a remote branch:
```shell
~/project $ git branch --unset-upstream
```
*This will stop the current local branch from pulling from the remote repositoriy when you do a simple* `git pull`*, but it will continue to push to the remote repository, along with other branches, when you do a* `git push --all`.


#### Delete a remote branch (from the remote repository):
```shell
~/project $ git push origin --delete old-branch
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches#_delete_branches)


--------------------------------------------------------------------------------


## References

Based on various Git References and Git Cheat Sheets, and other resources around the web!..
- {:#ref_gitref} Git Reference / Man Pages:
  <https://git-scm.com/docs>
- {:#ref_gitpro} Git Pro book:  
  <https://git-scm.com/book/en/v2>
- {:#ref_github_gcs} GitHub's Git Cheat Sheet:  
  <https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf>
- {:#ref_atlassian_gcs} Atlassian's Git Cheat Sheet:  
  <https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet>
- {:#ref_tower_gcs} Tower's Git Cheat Sheet:  
  <https://www.git-tower.com/blog/git-cheat-sheet/>
