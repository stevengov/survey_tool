require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surveys_index_url
    assert_response :success
  end

  test "should get show" do
    get surveys_show_url
    assert_response :success
  end

  test "should get create" do
    get surveys_create_url
    assert_response :success
  end
end
