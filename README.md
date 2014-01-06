# This is an HTML email generator powered by [Middleman](http://middlemanapp.com/getting-started/welcome/) and [Premailer](http://premailer.dialect.ca/)

This tool allows you to take a modern aproach (Haml, Sass, Markdown...) to creating HTML then
translates that into bullet resistant html email by injecting styles
into the appropriate places inline.

## For convenience sake
I created a "build.command" file so that people who are "terminal adverse" can build from finder.

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
