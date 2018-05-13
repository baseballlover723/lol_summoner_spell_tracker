require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get live_game" do
    get api_live_game_url
    assert_response :success
  end

end
