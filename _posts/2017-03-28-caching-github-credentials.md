---
title: "Caching GitHub credentials"
categories: Guides
tags: git GitHub
excerpt: Step-by-step through telling git to cache your GitHub credentials
date: 2017-03-09 21:00
last_modified_at: 2017-03-13 21:30
redirect_from: /website/caching-github-credentials.html
---

Following steps from the GitHub guide to [Caching your GitHub password in Git](https://help.github.com/articles/caching-your-github-password-in-git/):

Turn on the credential helper so that Git will save your password in memory for some time. By default, Git will cache your password for 15 minutes. To change the default password cache timeout to one hour, enter the following:
```shell
~/.../failbetter/github.io$ git config --global credential.helper 'cache --timeout=3600'
```
