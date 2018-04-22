---
# layout: post
title:  "Git Cheat Sheet"
categories: Programming
tags: git
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
Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_initializing_a_repository_in_an_existing_directory)


### Clone a repo from GitHub (or elsewhere):
```shell
~ $ git clone https://github.com/User/project.git
```
*__Note:__ can also be done with SSH, or from elsewhere on local filesystem*
Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_git_cloning)


### Set user details for git:
```shell
~/project $ git config --global user.email "you@example.com"
~/project $ git config --global user.name "Your Name"
```
*Omit `--global` to set the identity only in this repository.*
*__Note:__ If you don't set these options, git will ask you to do so the first time you try to commit anything!*  
Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_your_identity)


## Check your settings:
```shell
~/project $ git config --list
~/project $ git config user.name
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#_checking_your_settings)


## Basic use

### Show status of project:
```shell
~/project $ git status
```
*This shows you which branch you are on and which files are ready to commit, unstaged yet, or untracked*
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_checking_status)


### Stage changes in file / directory ready for the next commit:
```shell
~/project $ git add <file|directory>
```
ie. this will add all changed files in the current directory:
```shell
~/project $ git add .
```
Refs: Git Pro - [Tracking new files](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_tracking_files) | [Staging modified files](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_staging_modified_files)


### Remove a file:
```shell
~/project $ git rm file
```
*__Note:__ as well as removing the file from git's index of tracked files, this will also delete the file.*  
If you just want remove the file from version control, but not actually delete the file, use:
```shell
~/project $ git rm --cached file
```
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_removing_files)


### Commit the staged files:
```shell
~/project $ git commit -m "<message - try to keep to less than 50 chars!..>"
```
*If you omit* `-m "message"` *then a text editor will launch with a default commit message - this gives you the chance to add more lines of detail after the main commit message (I think...)*  
Ref: [Git Pro](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_committing_changes)


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
