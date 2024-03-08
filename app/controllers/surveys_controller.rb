class SurveysController < ApplicationController
  def index
    @surveys = Survey.order(:created_at)
  end

  def show
    @survey = Survey.find(show_params[:id])
    @responses = @survey.responses&.order(created_at: :desc)
  end

  def create
    @survey = Survey.new(create_params)
    if @survey.save
      redirect_to surveys_path
    else
      redirect_to new_survey_path, alert: @survey.errors.full_messages.join(", ")
    end
  end

  private

  def show_params
    params.permit(:id)
  end

  def create_params
    params.permit(:question)
  end
end
