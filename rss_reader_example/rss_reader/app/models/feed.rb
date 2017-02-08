# == Schema Information
#
# Table name: feeds
#
#  id    :integer          not null, primary key
#  title :text
#  url   :string           not null
#  note  :text
require 'open-uri'

class Feed < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :url, :url => true

  after_create :set_title, on: [:create]

  protected
    def set_title
      rss = SimpleRSS.parse(open(self.url, 'User-Agent' => 'ruby'))
      self.update(title: rss.channel.title)
    end
end
