require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
  end

  test "#index - should get index" do
    get surveys_url
    assert_response :success
    assert_not_nil assigns(:surveys)

    assert_select 'th', text: 'Question'
    assert_select 'th', text: 'Yes'
    assert_select 'th', text: 'No'
    assert_select 'th', text: 'Action'

    assert_select 'td', text: @survey.question
    assert_select 'td', text: @survey.yes_percentage.to_s + '%'
    assert_select 'td', text: @survey.no_percentage.to_s + '%'

    assert_select 'a.btn.btn-primary.mb-4[href=?]', new_survey_path, text: '+ Create New Survey'
    assert_select 'a[href=?]', survey_path(@survey), text: 'Show'
    assert_select 'a[href=?]', new_survey_response_path(@survey), text: 'New'
  end

  test "#show - when id is not present - should show survey" do
    assert_raises(ActionController::UrlGenerationError) do
      get survey_url(nil)
      assert_response :success
      assert_not_nil assigns(:survey)
      assert_not_nil assigns(:responses)
    end
  end

  test "#show - when id is present - should show survey" do
    get survey_url(@survey)
    assert_response :success
    assert_not_nil assigns(:survey)
    assert_not_nil assigns(:responses)

    assert_select 'h1', text: @survey.question
    assert_select 'a.btn.btn-secondary.mt-3[href=?]', surveys_path, text: 'Back to Surveys'

    assert_select 'p', text: 'Yes: ' + @survey.yes_percentage.to_s + '%, No: ' + @survey.no_percentage.to_s + '%'

    assert_select 'th', text: 'Response'
    assert_select 'th', text: 'Time'

    response = @survey.responses.first
    assert_select 'td', text: response.display_type
    assert_select 'td', text: response.created_at.strftime("%b %d, %Y, %I:%M %p")

  end

  test "#create - when question is not present - should not create survey" do
    assert_no_difference('Survey.count') do
      post surveys_url, params: { question: '' }
    end

    assert_redirected_to new_survey_path
    assert_not_empty flash[:alert]
  end

  test "#create - when params are valid - should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { question: 'New Survey Question' }
    end

    assert_redirected_to surveys_path
  end

  test "#new - should get new" do
    get new_survey_url
    assert_select 'form' do
      assert_select 'input[type=text]'
      assert_select 'input[type=submit]'
    end
    assert_select 'a.btn.btn-secondary.mt-3[href=?]', surveys_path, text: 'Back to Surveys'
  end
end
