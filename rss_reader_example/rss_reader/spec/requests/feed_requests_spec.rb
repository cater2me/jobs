require 'rails_helper'

RSpec.describe "Feed Requests", type: :request do
  let(:total) { 5 }
  let!(:db_feeds) do
    total.times do |x|
      url = "https://www.craigslist.org/about/best/all/index.rss"
      FactoryGirl.create(:feed, url: url + x.to_s)
    end
    Feed.all
  end


  it "has an index of feeds" do
    get "/api/feeds"

    json = JSON.parse(response.body)
    json_feeds = json["feeds"]
    expect(response).to be_success
    expect(json_feeds.length).to eq(total)

    # iterate and match each one
    keys = FeedSerializer._attributes.compact

    json_feeds.each_with_index do |feed, idx|
      db_feed = db_feeds[idx]
      keys.each do |key|
        expect(feed[key.to_s]).to eq(db_feed[key])
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
      expect(json["feed"]).to be_present
    end

    it "has entries" do
      get "/api/feeds/#{feed.id}"
      json = JSON.parse(response.body)

      expect(json["feed"]["entries"]).to be_present
    end

  end
end
