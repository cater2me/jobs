urls = [
  'http://lorem-rss.herokuapp.com/feed?unit=second&interval=10',
  'http://www.npr.org/rss/rss.php?id=1001',
  'https://www.craigslist.org/about/best/all/index.rss'
]

urls.each do |url|
  Feed.create(url: url)
end
