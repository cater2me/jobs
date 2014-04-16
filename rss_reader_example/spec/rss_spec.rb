require 'spec_helper'

describe "RSS Reader Model" do
	reader = RssReader.new
	context "Returns the right data" do
	data = reader.read_rss("http://www.michaelrigart.be/en/blog.rss")
	it "should return data" do
		expect(data.class).to eq Array
	end
	it "should default to 10 return entries" do
		expect(data.count).to eq 10
	end
end

	context "It can be passed a different number" do
		data = reader.read_rss("http://www.michaelrigart.be/en/blog.rss", 5)

		it "should return 5 entried when passed a parameter" do
			expect(data.count).to eq 5
		end
	end

	context "It defaults to 10 when passed 0 or a nagatvie number" do
	data = reader.read_rss("http://www.michaelrigart.be/en/blog.rss", -4)
		it "should default to 10 results" do
				expect(data.count). to eq 10
		end
	end
end

