require 'open-uri'
class ReadersController < ApplicationController
  helper ReadersHelper
  def root
    doc = Nokogiri::XML(open("https://news.ycombinator.com/rss"))
    @entries = ReadersHelper::parse(doc)
  end
end
