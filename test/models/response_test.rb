require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  test "should belong to survey" do
    response = Response.new
    assert_not response.save
    assert_not_empty response.errors[:survey]
  end

  test "should have RESPONSE_TYPE_MODELS constant defined" do
    assert_equal({ "YesResponse" => "YesResponse", "NoResponse" => "NoResponse" },
                 Response::RESPONSE_TYPE_MODELS)
  end
end
