require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  def setup
    @survey = Survey.new(question: "Test question?")
    @survey.save
  end

  test "should be valid" do
    assert @survey.valid?
  end

  test "question should be present" do
    @survey.question = ""
    assert_not @survey.valid?
  end

  test "yes_percentage with no responses" do
    assert_equal 0, @survey.yes_percentage
  end

  test "no_percentage with no responses" do
    assert_equal 0, @survey.no_percentage
  end
end
