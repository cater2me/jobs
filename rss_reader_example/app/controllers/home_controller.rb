require 'feedzirra'
require 'open-uri'
require 'ostruct'
require 'base64'

class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    feed = Feedzirra::Feed.fetch_and_parse(params[:url])
    @posts = []
    feed.entries.first(10).each do |entry|
      post = OpenStruct.new
      post.title = entry.title
      post.author = entry.author
      post.feed_url = feed.feed_url
      post.url = entry.url
      post.preview = entry.content.gsub(%r{</?[^>]+?>}, '').split[0..15].join(" ") + "..."
      post.content = entry.content
      @posts << post
    end
    render 'posts.js.erb'
  end

  def post
    feed_url = Base64.decode64(params[:feed_url])
    post_title = Base64.decode64(params[:post_title])

    logger.debug "feed_url: #{feed_url}"
    logger.debug "post_title: #{post_title}"

    feed = Feedzirra::Feed.fetch_and_parse(feed_url)

    posts = feed.entries.first(10).select {|entry| entry.title == post_title}
    @post = posts.first
    logger.debug "fetched: #{@post.title}"
    render 'post.js.erb'
  end
end
