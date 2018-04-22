---
# layout: post
title:  "Git Cheat Sheet"
categories: Programming
tags: Git
excerpt: Various reminders of how to do things in git!
---

## Setting up

### Initialise a new project:
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


### Clone a repo from gitHub (or elsewhere):
```shell
~ $ git clone https://github.com/User/project.git
```
(can also be done with SSH, or from elsewhere on local filesystem)


### Set user details for git:
```shell
~/project $ git config --global user.email "you@example.com"
~/project $ git config --global user.name "Your Name"
```
Omit `--global` to set the identity only in this repository.  If you don't set these options, git will ask you to do so the first time you try to commit anything!  
Refs: [GitHub](#ref_github_gcs) | [Atlassian](#ref_atlassian_gcs) | [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_your_identity)

## Basic use

### Show status of project:
Which branch you are on and which files are ready to commit, unstaged yet, or untracked:
```shell
~/project $ git status
```


### Stage changes in file / directory ready for the next commit:
```shell
~/project $ git add <file|directory>
```
ie. this will add all changed files (run from the root of the project!):
```shell
~/project $ git add .
```


### Remove a file:
```shell
~/project $ git rm file
```
Note: as well as removing the file from git's list of files, this will also delete the file.  If you just want remove the file from version control, but not actually delete the file, use:
```shell
~/project $ git rm --cached file
```


### Commit the staged files:
```shell
~/project $ git commit -m "<message - try to keep to less than 50 chars!..>"
```
If you omit `-m "message"` then a text editor will launch with a default commit message - this gives you the chance to add more lines of detail after the main commit message (I think...)


## References

Based on various other Git Cheat Sheets, and other resources around the web!..
- {:#ref_gitpro} Git Pro book:  
  <https://git-scm.com/book/en/v2>
- {:#ref_github_gcs} GitHub's Git Cheat Sheet:  
  <https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf>
- {:#ref_atlassian_gcs} Atlassian's Git Cheat Sheet:  
  <https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet>
- {:#ref_tower_gcs} Tower's Git Cheat Sheet:  
  <https://www.git-tower.com/blog/git-cheat-sheet/>
