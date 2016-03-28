class Api::FeedsController < ApplicationController
  def get_feed
    # require 'byebug'; debugger
    render json: {feed_url: params[:feed_url]}
  end
end
