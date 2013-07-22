require 'sinatra'
require 'nokogiri'

get '/' do
  "RSS Reader"
end

def parse feed
	doc = Nokogiri::XML feed
  doc.search('item').map do |doc_item|
    item = {}
    item[:link] = doc_item.at('link').text
    item[:title] = doc_item.at('title').text	
    item[:pubDate] = doc_item.at('pubDate').text
    item[:author] = doc_item.at('author').text
    item
	end
end
