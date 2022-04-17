require "test_helper"

class Customer::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get customer_products_top_url
    assert_response :success
  end

  test "should get about" do
    get customer_products_about_url
    assert_response :success
  end

  test "should get index" do
    get customer_products_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_products_show_url
    assert_response :success
  end
end
