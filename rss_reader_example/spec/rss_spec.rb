require File.expand_path '../spec_helper.rb', __FILE__

describe "RSSApp" do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should accept an rss feed url and return 10 entries or less" do
    post '/rss', {feed: 'http://www.boobooninja.com/feed'}
    expect(last_response).to be_ok
    expect(last_response.body).to include('<p>Loren Hale</p>')
  end

end
