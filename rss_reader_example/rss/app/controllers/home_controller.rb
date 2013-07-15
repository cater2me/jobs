class HomeController < ApplicationController
	
	def index
	end
	
	 
	def rss_feed
		@feed_list = []
		feed = Feedzirra::Feed.fetch_and_parse(params[:rss][:url])
	 
		if feed.instance_of?(Fixnum)  || params[:rss][:url].blank?
			flash.now[:error] = "The URL is either not provided or is not a valid RSS/Atom feed !!"
			render 'invalid_feed'  , :formats=>[:js]
			return
		end
 
		 
		feed.entries.first(10).each do |entry|
			rss = {:title => entry.title || 'Title Unknown', :author => entry.author || "Unknown Author", :feed_url => feed.feed_url, 
				:url => entry.url,  :published=>entry.published, 
				:preview => (!entry.summary.nil? ? entry.summary.sanitize : "No summary was provided by this feed !!")}
				
				rss[:content] = (!entry.content.nil? ? entry.content.sanitize : ('This feed did not provide the contents of the article itself !! But you can click on Link To Article button to read it !!'))
			@feed_list << rss
		end 
		render 'rss_feed', :formats=>[:js]
	end
	
	  
end
