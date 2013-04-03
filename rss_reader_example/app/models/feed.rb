require 'feedzirra'

class Feed < ActiveRecord::Base
  attr_accessible :title, :url
  after_create :fetch_posts

  validates :url, :uniqueness => true

  has_many :posts

  private

    def fetch_posts
      feed = Feedzirra::Feed.fetch_and_parse(self.url)

      feed.entries.first(10).each do |entry|
        Post.create(:feed_id => self.id, :author => entry.author, :content => entry.content, :title => entry.title, :url => entry.url)
      end
    end
end
