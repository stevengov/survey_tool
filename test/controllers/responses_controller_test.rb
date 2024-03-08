require "test_helper"

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey = surveys(:one)
    @response_type = Response::RESPONSE_TYPE_MODELS.keys.first 
  end

  test "#new - when survey_id is present - should get new" do
    get new_survey_response_url(@survey.id)
    assert_response :success
    assert_not_nil assigns(:survey)

    assert_select 'h1', text: @survey.question
    assert_select 'form' do
      assert_select 'input[type=radio][id=response_type_yes]'
      assert_select 'input[type=radio][id=response_type_no]'
      assert_select 'input[type=submit]'
    end
    assert_select 'a.btn.btn-secondary.mt-3[href=?]', surveys_path, text: 'Back to Surveys'
  end

  test "#new - when survey_id is not present - should not get new" do
    assert_raises(ActionController::UrlGenerationError) do
      get new_survey_response_url(nil)
      assert_nil assigns(:survey)
    end
  end

  test "#create - when survey_id is not present - should not create response" do
    assert_raises(ActionController::UrlGenerationError) do
      post survey_responses_url(nil), params: { response: { response_type: @response_type, survey_id: nil } }
      assert_nil assigns(:response)
    end
  end

  test "#create - when response_type is not present - should not create response" do
    assert_no_difference('Response.count') do
      post survey_responses_url(@survey), params: { response: { response_type: nil, survey_id: @survey.id } }
      assert_nil assigns(:response)
    end

    assert_redirected_to new_survey_response_url(@survey.id)
  end

  test "#create - when params are valid - should create response" do
    assert_difference('Response.count') do
      post survey_responses_url(@survey), params: { response: { response_type: @response_type, survey_id: @survey.id } }
      assert_not_nil assigns(:response)
    end

    assert_redirected_to survey_url(Response.last.survey)
  end
end
