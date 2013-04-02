require 'spec_helper'

describe "Posts" do
  describe "Home" do
    it "should return articles for a valid url" do
      visit '/'
      fill_in "url", :with => "http://feeds.feedburner.com/PaulDixExplainsNothing"
      click_button "get_posts"
      page.has_content? "Articles"
    end

    it "should return an error message for an invalid URL" do
      visit '/'
      fill_in "url", :with => "http://feeds.feedburner123.com/PaulDixExplainsNothing"
      click_button "get_posts"
      page.has_content? "The URL provided is not a valid RSS/Atom feed."
    end
  end
end
