require 'sinatra'
require 'simple-rss'
require 'open-uri'

class RSSApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/rss' do
    url = params[:feed]
    @posts = []
    if url
      @posts = SimpleRSS.parse(open(url)).items.pop(10)
    end

    erb :posts
  end

end
