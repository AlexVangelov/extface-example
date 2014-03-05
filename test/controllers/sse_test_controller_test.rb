require 'test_helper'

class SseTestControllerTest < ActionController::TestCase
  test "should get stream" do
    get :stream
    assert_response :success
  end

end
