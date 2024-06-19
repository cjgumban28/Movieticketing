require "test_helper"

class TheatresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theatres_index_url
    assert_response :success
  end
end
