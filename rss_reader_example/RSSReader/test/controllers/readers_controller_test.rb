require 'test_helper'

class ReadersControllerTest < ActionController::TestCase
  test "should get root" do
    get :root
    assert_response :success
  end

end
