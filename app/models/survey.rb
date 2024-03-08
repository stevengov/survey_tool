class Survey < ApplicationRecord
  validates :question, presence: true
  has_many :responses, dependent: :destroy

  def yes_percentage
    response_percentage(yes_responses_count)
  end

  def no_percentage
    response_percentage(no_responses_count)
  end

  private
  
  def response_percentage(response_type)
    response_count = yes_responses_count + no_responses_count
    return 0 unless response_count.positive?
  
    (response_type.to_f / response_count * 100).round(2)
  end
end
