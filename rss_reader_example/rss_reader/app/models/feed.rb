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

  has_many :entries, dependent: :destroy

  def latest_entries
    self.entries.order("pubDate DESC").limit(10)
  end

  protected
    def set_title
      rss = SimpleRSS.parse(open(self.url, 'User-Agent' => 'ruby'))
      self.update(title: rss.channel.title)
      create_entries(rss)
    end

    def create_entries(rss)
      keys = Entry.column_names - ["id", "feed_id", "created_at", "updated_at"]
      keys.map! { |x| x.to_sym }

      rss.entries.each do |entry|
        entry = Feed.scrub(entry)
        begin
          self.entries.create!(entry.slice(*keys))
        rescue e
          puts 'create_entries error: #{e}'
          next
        end
      end
    end

    def self.scrub(entry)
      entry.each do |k, v|
        entry[k] = v.is_a?(String) ? v.force_encoding("utf-8") : v
      end
      entry
    end
end
