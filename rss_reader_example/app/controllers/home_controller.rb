require 'feedzirra'
require 'open-uri'
require 'ostruct'

class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    feed = Feedzirra::Feed.fetch_and_parse(params[:url])
    feed.entries.first(1).each do |entry|
      @post = OpenStruct.new
      @post.title = entry.title
      @post.author = entry.author
      @post.preview = entry.content
    end
    render 'posts.js.erb'
  end
end
