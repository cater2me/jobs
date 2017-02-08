# == Schema Information
#
# Table name: feeds
#
#  id    :integer          not null, primary key
#  title :text
#  url   :string           not null
#  note  :text
#

class FeedSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :note
end
