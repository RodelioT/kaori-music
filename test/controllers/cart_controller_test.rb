require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get cart_checkout_url
    assert_response :success
  end

  test "should get clear_shopping_cart" do
    get cart_clear_shopping_cart_url
    assert_response :success
  end

end
