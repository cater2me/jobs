require 'open-uri'

class FeedsController < ApplicationController
  def index
  end
  
  def create
    url = feed_params[:url]
    feed = SimpleRSS.parse(open(url));
    # feed.items.each_with_index do |item, i|
    #   feed.items[i]['parsed_preview'] = self.get_page_preview(item.link)
    # end
    render json: feed
  end
  
  # FIGURE A BETTER WAY TO GET PREVIEW
  # SIMPLE-RSS GEM DESCRIPTION IS CRAP
  
  # def get_page_preview(url)
  #   #raise "SSL Error" if OpenSSL::SSL::SSLError
  #   begin
  #     doc = Nokogiri::HTML(open(url))
  #   rescue URI::InvalidURIError => error
  #     return ""
  #   end
  # 
  #   doc.xpath("//p").map do |item|
  #     item.text.chomp
  #   end[0..5]
  # end
  
  private
  def feed_params
    params.require(:feed).permit(:url)
  end

end
