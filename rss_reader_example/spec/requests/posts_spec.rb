require 'spec_helper'

describe "Posts" do
  describe "Home" do
    it "should return " do
      visit '/'
      fill_in "url", :with => "http://feeds.feedburner.com/PaulDixExplainsNothing"
      click_button "get_posts"
      page.has_content? "Articles"
    end
  end
end
