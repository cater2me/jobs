require 'feedzirra'

class Feed < ActiveRecord::Base
  attr_accessible :title, :url
  after_create :fetch_posts

  validates :url, :uniqueness => true

  has_many :posts, :dependent => :destroy

  private

    def fetch_posts
      logger.debug "Fetching posts"
      feed = Feedzirra::Feed.fetch_and_parse(self.url)
      self.title = feed.title
      feed.entries.first(10).each do |entry|
        logger.debug "Post: #{entry.title}"
        post = Post.new(:author => entry.author, :content => entry.content, :title => entry.title, :url => entry.url)
        post.feed = self
        logger.debug "Feed id: #{post.feed.id}"
        post.save
      end
      self.save
    end
end
