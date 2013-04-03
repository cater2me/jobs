require 'feedzirra'

class Feed < ActiveRecord::Base
  attr_accessible :title, :url

  validates :url, :uniqueness => true

  has_many :posts, :dependent => :destroy

  def fetch_posts
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    self.title = feed.title

    recently_fetched = self.posts.first(20)
    feed.entries.first(10).each do |entry|
      # strip tags from preview
      summary = entry.summary || "No summary was provided by the feed."
      post = Post.new(:preview => summary.gsub( %r{</?[^>]+?>}, '' ), :author => entry.author || "...someone, :content => entry.content, :title => entry.title, :url => entry.url)
      post.feed = self
      post.save if recently_fetched.select {|rec| rec.url == post.url}.count == 0
    end
    self.save
  end
end
