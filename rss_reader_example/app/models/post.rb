class Post < ActiveRecord::Base
  attr_accessible :author, :content, :title, :url

  validates :url, :uniqueness => true

  belongs_to :feed
end
