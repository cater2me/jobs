require 'spec_helper'

 describe "Controller Tests" do

    it "renders the index template" do
      get :index
      expect(page).to render_template("index")
    end
  end
