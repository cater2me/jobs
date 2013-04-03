class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title, :url, :preview, :published_date

  validates :url, :uniqueness => true

  belongs_to :feed
end
