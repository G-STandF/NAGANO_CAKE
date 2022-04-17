require "test_helper"

class Customer::AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_adresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_adresses_edit_url
    assert_response :success
  end
end
