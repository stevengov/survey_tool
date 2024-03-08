class Survey < ApplicationRecord
  validates :question, presence: true
  has_many :responses, dependent: :destroy

  def yes_percentage
    response_count = yes_responses_count + no_responses_count
    return 0 unless response_count.positive?

    (yes_responses_count.to_f / response_count * 100).round(2)
  end

  def no_percentage
    response_count = yes_responses_count + no_responses_count
    return 0 unless response_count.positive?

    (no_responses_count.to_f / response_count * 100).round(2)
  end
end
