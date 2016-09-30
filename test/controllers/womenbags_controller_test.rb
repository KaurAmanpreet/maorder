require 'test_helper'

class WomenbagsControllerTest < ActionController::TestCase
  test "should get womenbags" do
    get :womenbags
    assert_response :success
  end

end
