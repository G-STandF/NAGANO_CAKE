require "test_helper"

class Customer::GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_genre_index_url
    assert_response :success
  end
end
