require 'spec_helper'

feature "rss feed" do

    scenario "has home page" do 
      visit root_url
      expect(page).to have_content "Simple RSS"
    end
  
    scenario "has search box", :js => true do 
      visit root_url
      expect(page).to have_content "Enter Feed URL"
    end
  
    feature "input search", :js => true do
      scenario "redirects to team index page after signup" do
        visit root_url
        fill_in 'url', :with => "http://www.reddit.com/.rss"
        click_on "Submit"
        expect(page).to have_content "Results"
      end

    end


end