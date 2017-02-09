require 'rails_helper'

RSpec.describe Feed, type: :model do
  let(:rss) { 'https://www.craigslist.org/about/best/all/index.rss' }

  it "requires a url" do
    expect(FactoryGirl.build(:feed, url: nil)).to_not be_valid
  end

  context "when given a valid url" do
    let!(:feed) { FactoryGirl.create(:feed, url: rss) }

    it "title is generated" do
      expect(feed.title).to be_present
    end

    it "entries are generated" do
      expect(feed.entries).to be_present
    end

    it "returns the latest 10 entries" do
      expect(feed.latest_entries).to be_present
      expect(feed.latest_entries.size).to be <= 10
    end
  end
end
