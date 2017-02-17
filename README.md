# Full Stack Engineer Development Challenge Submission

This is a submission for a developer role at [cater2.me](http://cater2.me/jobs).

![rssreader](https://cloud.githubusercontent.com/assets/6300995/23050049/d2ace738-f474-11e6-916e-cd88c48acac7.gif)

Below I'll list additional comments regarding the two challenges.

#### Refactor Example
My main decision is extracting a `substitute_code` method after realizing the template logic was duplicated for both codes. There are further optimizations to consider but I'd like to know more about the kind of data this code would be working with in order to determine if further optimizations are appropriate or necessary.

#### RSS reader
This project was built with Ruby 2.0.0 and Rails 4, with React/Redux as the front-end framework.

To setup the app in the `rss_reader_example/rss_reader` directory

`$ bundle install`  
`$ npm --yes init`  
`$ npm install`  
`$ rails server`  

For the back-end, I utilized `SimpleRSS` to parse RSS urls and used `active model serializers` with a JSON API configuration to expose a RESTful `Feeds` api end point for the front-end.

Much of the business logic is handled in the feeds model and serializer, which is the json view template. Please examine `app/models/feed/feed.rb` to see how rss entires are generated and `app/serializers/entry_serializer.rb` to see the logic for exposing the parsed entries.

For the front-end, I used React for my views and Redux for the app. All of this code can be examined within the `frontend` directory.

I was not as familiar with the different types of feeds, so I encountered difficulties in parsing the different websites' RSS, XML, or Atom feeds. One major question I've had was how to handle the full article feature - not every feed had html or content sent, so the projects tries to determine an appropriate preview and content per entry.

To improve this project, I'd like to know what kind RSS feeds does the app serve in order to better tailor the parsing. I would consider using `Feedjira` over SimpleRSS if there are many types of feeds to parse - Feedjira has more opinionated parsing and thus can provide better support, instead of manually implementing them with SimpleRSS.

For the full article feature, I'd clarify if the full article is the the content coming from the RSS feed or if the app is supposed to scrape it manually. For example, if a parsed feed entry doesn't have a `content` or `content_encoded`, which I assumed to be the full articles, then the app can try scraping the entries url using a tool such as Nokogiri. It'd be a significant implementation, but it would supplement that feature for other RSS feeds which lack that content.
