require_relative '../models/rss'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/results' do
	thing = RssReader.new
	@url = thing.read_rss(params["url"])
	if @url != false
		erb :results
		else
		erb :error	
	end
end

get '/error' do
	erb :error
end
