require 'rss'

class RssReader
	def read_rss(link, amount = 10)
		rss = RSS::Parser.parse(link, false)

		rss.items.pop(amount).each do |item|
			puts "Title: #{item.title}"
			puts "Published: #{item.pubDate}"
			puts "Author: #{item.author}"
		end
	end

end


read = RssReader.new
read.read_rss('http://www.michaelrigart.be/en/blog.rss', 1)


#Display the title, time, author and preview of each entry