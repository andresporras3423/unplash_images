require 'test_helper'

class FavoriteImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_images_index_url
    assert_response :success
  end

  test "should get show" do
    get favorite_images_show_url
    assert_response :success
  end

  test "should get edit" do
    get favorite_images_edit_url
    assert_response :success
  end

  test "should get create" do
    get favorite_images_create_url
    assert_response :success
  end

end
