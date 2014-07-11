require '../spec_helper'

describe HomeController ,  :type => :controller do

	describe "GET 'index'" do
		it "renders the index template" do
			get :index
			response.should render_template("index")
		end
	end
  
	describe "Rss Feed" do
		it "should return an error message for an invalid URL" do
			get :rss_feed, :rss=>{:url => "http://feeds.feedburner.com/PaulDixExplains" }
			response.should render_template("invalid_feed")
		end

		it "should return articles for a valid url" do
			get :rss_feed, :rss=>{:url => "http://feeds.feedburner.com/PaulDixExplainsNothing" }
			response.should render_template("rss_feed")
		end
    
	end

end