# Mailman

## makes developing ~~websites~~ email simple

Mailman is a configuration of the [Middleman](http://middlemanapp.com/) static site generator geared towards creating HTML email. Now, you can use all the modern affordances that you've come to expect on the web (Haml, Sass, Markdown...) to create HTML email. Then, let the robots make it ugly and bullet restistant by injecting inline styles into the appropriate places with [premailer](http://premailer.dialect.ca/). Next, publish to [GitHub Pages](http://pages.github.com/) with [Middleman's deploy extension](https://github.com/tvaughan/middleman-deploy) so you have web accessible assets and send test emails via [Mandrill](http://mandrill.com/). All without leaving the comfort of your command line.

## For convenience sake

I created a "build.command" file so that people who are "terminal adverse" can build from finder. This can be a little fidgity if you use multiple version of ruby. You'll need to adjust the shebang appropriately for your environment.

## Basic use

Create a folder to contain the assets of your email. 

Inside that folder create an index.html.md file in this form:

```
---
title: Email title
volume: 1
issue: 31
date: October 2, 2013
---

# Feel free to put content here

But you don't have to. This space offers a place to put content not
in one of the linked files.
```
Next, create one markdown file for each section of the email in this
form:

```
---
title: This is the title of the first article
---

This is some content.
```

When you are done, doubleclick the "build.command" file at the root of
the project. That will create a well formed document in the "build"
folder that you can paste into the Constant Contact form.
