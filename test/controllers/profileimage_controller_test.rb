require "test_helper"

class ProfileimageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profileimage_new_url
    assert_response :success
  end

  test "should get index" do
    get profileimage_index_url
    assert_response :success
  end

  test "should get show" do
    get profileimage_show_url
    assert_response :success
  end
end
