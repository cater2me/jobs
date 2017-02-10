# == Schema Information
#
# Table name: entries
#
#  id              :integer          not null, primary key
#  title           :string
#  link            :string
#  description     :text
#  pubDate         :string
#  guid            :string
#  dc_creator      :string
#  content_encoded :text
#  feed_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class EntrySerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :author,
              :published_date,
              :preview,
              :content

  def author
    object.author || object.contributor || object.dc_creator
  end

  def published_date
    object.pubDate || object.published || object.created_at
  end

  def preview
    preview = object.summary || object.description.split.take(10).join(' ') + '...'
    preview.html_safe
  end

  def content
    content = object.content_encoded || object.content || object.description || "No Content Fetched"
    content.html_safe
  end
end
