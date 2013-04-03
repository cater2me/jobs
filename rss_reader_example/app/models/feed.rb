require 'feedzirra'

class Feed < ActiveRecord::Base
  attr_accessible :title, :url
  after_create :fetch_posts

  validates :url, :uniqueness => true

  has_many :posts, :dependent => :destroy

  private

    def fetch_posts
      feed = Feedzirra::Feed.fetch_and_parse(self.url)
      self.title = feed.title
      feed.entries.first(10).each do |entry|
        post = Post.new(:preview => entry.summary, :author => entry.author, :content => entry.content, :title => entry.title, :url => entry.url)
        post.feed = self
        post.save
      end
      self.save
    end
end
