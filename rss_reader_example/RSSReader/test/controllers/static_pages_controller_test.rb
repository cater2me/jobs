require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test '#root should render home page with RSS reader in it' do

    get :root
    assert_response :success
    # tests presence of html element with the id of 'rssReader'
    assert_select "#rssReader", 1

  end

end
