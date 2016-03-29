class Api::FeedsController < ApplicationController
  helper Api::FeedsHelper
  def get_feed
    doc = Nokogiri::XML(open(params[:feed_url]))
    render json: {entries: Api::FeedsHelper::parse(doc).take(10)}
  end
end
