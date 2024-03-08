require "test_helper"

class YesResponseTest < ActiveSupport::TestCase
  test "should belong to survey" do
    yes_response = YesResponse.new
    assert_not yes_response.valid?
    assert_not_empty yes_response.errors[:survey]
  end

  test "display_type should return 'Yes'" do
    yes_response = YesResponse.new
    assert_equal "Yes", yes_response.display_type
  end
end
