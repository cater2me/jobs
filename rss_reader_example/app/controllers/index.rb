require_relative '../models/rss'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/results' do
	thing = RssReader.new
	@amount = thing.make_number(params["amount"])
	@url = thing.read_rss(params["url"], @amount)
	if @url != false
		erb :results
		else
		erb :error	
	end
end

get '/error' do
	erb :error
end
