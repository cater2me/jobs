require 'rails_helper'
require 'byebug'

RSpec.describe "Feed Requests", type: :request do
  let(:total) { 5 }
  before do
    total.times do |x|
      url = "https://www.craigslist.org/about/best/all/index.rss"
      FactoryGirl.create(:feed, url: url + x.to_s)
    end
  end


  it "has an index of feeds" do
    get "/api/feeds"

    json = JSON.parse(response.body)
    json_feeds = json["data"]
    expect(response).to be_success
    expect(json_feeds.length).to eq(total)

    # iterate and match each one
    keys = FeedSerializer._attributes.compact - [:id]

    json_feeds.each_with_index do |feed, idx|
      db_feed = Feed.find feed["id"]
        keys.each do |key|
          expect(feed["attributes"][key.to_s]).to eq(db_feed[key])
        end
    end
  end

  it "creates a feed" do
    data = {feed: { url: "https://www.craigslist.org/about/best/all/index.rss"}}

    post "/api/feeds", data

    expect(response).to be_success
  end

  context "showing a feed" do
    let!(:feed) { FactoryGirl.create(:feed, url: 'https://www.craigslist.org/about/best/all/index.rss') }

    it "shows a feed" do
      get "/api/feeds/#{feed.id}"
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json["data"]).to be_present
    end
  end
end
