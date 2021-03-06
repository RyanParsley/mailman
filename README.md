# Mailman

## makes developing ~~websites~~ email simple

Mailman is a configuration of the [Middleman](http://middlemanapp.com/) static site generator geared towards creating HTML email. Now, you can use all the modern affordances that you've come to expect on the web (Haml, Sass, Markdown...) to create HTML email. Then, let the robots make it ugly and bullet restistant by injecting inline styles into the appropriate places with [Premailer](http://premailer.dialect.ca/). Next, publish to [GitHub Pages](http://pages.github.com/) with [Middleman's deploy extension](https://github.com/tvaughan/middleman-deploy) so you have web accessible assets and send test emails via [Mandrill](http://mandrill.com/). All without leaving the comfort of your command line.

## For convenience sake

I created a "build.command" file so that people who are "terminal adverse" can build from finder. This can be a little fidgity if you use multiple versions of ruby (RVM). You'll need to adjust the shebang appropriately for your environment.

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

### Build

When you are done, generate html in the build folder with:

```
middleman build
``` 
### Deploy

Push html to GitHub Pages with:

```
middleman deploy
```

### Send

I've set up a rake task for sending email via Mandrill:

```
rake send
```

## Setup/ Configuration

Clone this repo locally and follow along with general [documentation for Middleman](http://middlemanapp.com/).

### data/site.yml

This is where you configure test data such as sender contact
information to be used in the email campaign.

### .env

I'd recommend putting your Mandrill api key in a .env file that is
excluded from version control.

```
ENV['MANDRILL_APIKEY'] = ''
```

### Rakefile

This is where you set other variables that allow you to send via the Mandrill service.
