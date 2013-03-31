require 'feedzirra'
require 'open-uri'
require 'ostruct'

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
      post.preview = entry.content.gsub(%r{</?[^>]+?>}, '').split[0..15].join(" ") + "..."
      @posts << post
    end
    render 'posts.js.erb'
  end
end
