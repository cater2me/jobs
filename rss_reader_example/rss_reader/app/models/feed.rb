# == Schema Information
#
# Table name: feeds
#
#  id    :integer          not null, primary key
#  title :text
#  url   :string           not null
#  note  :text

class Feed < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :url, :url => true
end
