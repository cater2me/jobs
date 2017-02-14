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
# require 'cgi'
require 'html/sanitizer'

class EntrySerializer < ActiveModel::Serializer
  attributes  :id,
              :link,
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
    full_sanitizer = HTML::FullSanitizer.new
    preview = object.summary || object.description
    preview = CGI.unescapeHTML(preview)
    full_sanitizer.sanitize(preview).split.take(10).join(' ') + '...'
  end

  def content
    content = object.content_encoded || object.content || object.description || "No Content Fetched"
    CGI.unescapeHTML(content)
  end
end
