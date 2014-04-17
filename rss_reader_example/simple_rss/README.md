# Simple RSS

Creates a simple RSS feed in a single-page app using Rails, Backbone, and `simple-rss` gem, along with Bootstrap for simple CSS styling.

## Features

* Input URL in search box
* Submit to render 10 most recent entries in the RSS feed
* Renders error message if URL is invalid
* Articles in each entry can be opened in new window, or in an overlay using `iframe` in a JS modal view
* Feeds and entries are not currently saved in database, and everything is cleared when page is refreshed
* However, Rails gives us the option to save feeds and entries if we desired
* Backbone allows more flexibility and opportunity for better front-end UI

## Testing

Run `rspec/spec` to test specs. Tests currently written in Capybara for Rails. I still need to learn how to write tests for Javascript.

## TODOS

* Write more tests (use Jasmine or find alternative to test JS)
* Override `X-Frame-Options` to allow any content to be rendered in overlay
* Find best ways to get author and previews for each entry. RSS gems provided insufficient data and using Nokogiri to parse HTML was inefficient
