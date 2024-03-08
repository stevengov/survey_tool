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

  test "should have many responses" do
    assert_equal @survey.responses.new.class, NoResponse
  end

  test "should destroy associated responses" do
    @survey.save
    YesResponse.create(survey: @survey)
    assert_difference "Response.count", -1 do
      @survey.destroy
    end
  end

  test "yes_percentage calculation" do
    YesResponse.create(survey: @survey)
    NoResponse.create(survey: @survey)
    assert_equal 50.0, @survey.yes_percentage
  end

  test "no_percentage calculation" do
    YesResponse.create(survey: @survey)
    NoResponse.create(survey: @survey)
    assert_equal 50.0, @survey.no_percentage
  end

  test "yes_percentage with no responses" do
    assert_equal 0, @survey.yes_percentage
  end

  test "no_percentage with no responses" do
    assert_equal 0, @survey.no_percentage
  end
end
