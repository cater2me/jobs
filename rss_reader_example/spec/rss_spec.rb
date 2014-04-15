require 'spec_helper'

describe "RSS Reader Model" do
  it "should create a new class instance" do
    reader = RssReader.new
    expect(RssReader.all).to eq 1
  end
end
