class ResponsesController < ApplicationController
  def new
    @survey = Survey.find(new_params[:survey_id])
  end

  def create # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    klass = response_klass(create_params[:response_type])
    unless klass
      return redirect_to new_survey_response_path(create_params[:survey_id]),
                         alert: "Must select a response"
    end

    @response = klass.new(survey_id: create_params[:survey_id])
    if @response.save
      redirect_to survey_path(@response.survey)
    else
      redirect_to new_survey_response_path(@response.survey),
                  alert: @response.errors.full_messages.join(", ")
    end
  end


  private

  def create_params
    params.require(:response).permit(:response_type, :survey_id)
  end

  def new_params
    params.permit(:survey_id)
  end

  def response_klass(type)
    Response::RESPONSE_TYPE_MODELS[type]&.constantize
  end
end
