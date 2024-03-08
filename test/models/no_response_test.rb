require "test_helper"

class NoResponseTest < ActiveSupport::TestCase
  test "should belong to survey" do
    no_response = NoResponse.new
    assert_not no_response.valid?
    assert_not_empty no_response.errors[:survey]
  end

  test "display_type should return 'No'" do
    no_response = NoResponse.new
    assert_equal "No", no_response.display_type
  end
end
