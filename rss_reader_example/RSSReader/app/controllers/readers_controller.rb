require 'open-uri'
class ReadersController < ApplicationController
  helper ReadersHelper
  def root
    # doc = Nokogiri::XML(open("https://www.reddit.com/.rss"))
    doc = Nokogiri::XML(open("https://news.ycombinator.com/rss"))
    # doc = Nokogiri::XML(open("http://w1.weather.gov/xml/current_obs/KFAT.rss"))
    # doc = Nokogiri::XML(open("https://www.osha.gov/pls/oshaweb/federalregister.xml"))

    # render xml: doc.xpath('//item')
    # render text: ReadersHelper::parse_rss(doc)
    # render xml: doc
    @entries = ReadersHelper::parse(doc)
  end
end
