class Api::FeedsController < ApplicationController
  def index
    feeds = Feed.all
    render json: feeds, root: 'feeds'
  end

  def create
    feed = Feed.new(feed_params)

    if feed.save!
      render json: feed, status: :created
    else
      render json: feed.errors, status: :unprocessable_entity
    end
  end

  def show
    feed = Feed.find(params[:id])
    render json: feed
  end

  protected
    def feed_params
      params.require(:feed).permit(:url)
    end
end
