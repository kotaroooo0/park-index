require 'test_helper'

class SkiresortsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get skiresorts_path, params: {area_id: 1}
    assert_response :success
  end

  test "should get search" do
    get skiresorts_search_path, params: {search: "query"}
    assert_response :success
  end

  test "should not get show" do
    get skiresort_path
    assert_not_response :success
  end

end
