require 'rails_helper'
require 'open-uri'
require 'nokogiri'
# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  it "parses titles correctly" do
    doc = Nokogiri::XML(open("http://w1.weather.gov/xml/current_obs/KLAX.rss"))
    first_title = doc.xpath('//title').first.content

    expect(ApplicationHelper::parse(doc).last[:title]).to eq(doc.xpath('//title').last.content)
  end
end
