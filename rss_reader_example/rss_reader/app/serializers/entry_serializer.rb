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
              :link,
              :pubDate,
              :dc_creator,
              :description,
              :content_encoded
end
