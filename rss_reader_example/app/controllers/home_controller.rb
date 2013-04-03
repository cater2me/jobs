require 'feedzirra'
require 'open-uri'
require 'ostruct'
require 'base64'

class HomeController < ApplicationController

  def posts
    feed = Feedzirra::Feed.fetch_and_parse(params[:url])
    
    if feed == 0 || params[:url].blank?
      render 'invalid_url.js.erb' 
      return
    end
    
    @posts = []
    feed.entries.first(10).each do |entry|
      # stripped tags from preview
      post = {:title => entry.title, :author => entry.author, :feed_url => feed.feed_url, :url => entry.url,
        :preview => entry.summary.gsub( %r{</?[^>]+?>}, '' )}

      @posts << post
    end
    render 'posts.js.erb'
  end

  def post
    feed_url = Base64.decode64(params[:feed_url])
    post_title = Base64.decode64(params[:post_title])

    feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    # get the first 15 incase anything was released...a little hacky but its okay
    posts = feed.entries.first(15).select {|entry| entry.title == post_title}
    @post = posts.first

    render 'post.js.erb'
  end

end
