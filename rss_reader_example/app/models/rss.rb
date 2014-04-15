require 'rss'

class RssReader
	
	def read_rss(link, amount = 10)
		results = []
		rss = RSS::Parser.parse(link, false)
		if rss
			rss.items.pop(amount).each do |item|
				items = ["Title: #{item.title}",
				"Published: #{item.pubDate}",
				"Author: #{item.author}"]
				results << items
			end
			results
		else
			false
		end
	end

	def make_number(number)
		number = number.to_i
		number < 1 ? 10 : number
	end

end


#Display the title, time, author and preview of each entry