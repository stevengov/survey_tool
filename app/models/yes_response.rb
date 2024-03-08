class YesResponse < Response
  belongs_to :survey, counter_cache: :yes_responses_count

  def display_type
    "Yes"
  end
end
