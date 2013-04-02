require 'feedzirra'
require 'open-uri'
require 'ostruct'
require 'base64'

class HomeController < ApplicationController

  def posts
    feed = Feedzirra::Feed.fetch_and_parse(params[:url])
    
    if feed.try(:entries).nil?
      render 'invalid_url.js.erb' 
      return
    end
    
    @posts = []
    feed.entries.first(10).each do |entry|
      post = {:title => entry.title, :author => entry.author, :feed_url => feed.feed_url, :url => entry.url,
        :preview => entry.content.gsub(%r{</?[^>]+?>}, '').split[0..15].join(" ") + "..."}

      @posts << post
    end
    render 'posts.js.erb'
  end

  def post
    feed_url = Base64.decode64(params[:feed_url])
    post_title = Base64.decode64(params[:post_title])

    feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    posts = feed.entries.first(10).select {|entry| entry.title == post_title}
    @post = posts.first

    render 'post.js.erb'
  end

end
