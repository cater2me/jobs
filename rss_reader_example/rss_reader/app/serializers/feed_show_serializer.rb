class FeedShowSerializer < FeedSerializer
  has_many :entries

  def entries
    object.latest_entries
  end
end
