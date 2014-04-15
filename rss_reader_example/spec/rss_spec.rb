require 'spec_helper'

describe "RSS Reader Model" do
	thing = RssReader.new
	data = thing.read_rss("http://www.michaelrigart.be/en/blog.rss")
	it "should return data" do
		expect(data.class).to eq Array
	end
	it "should default to 10 return entries" do
		expect(data.count).to eq 10
	end
end
