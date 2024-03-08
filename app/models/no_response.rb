class NoResponse < Response
  belongs_to :survey, counter_cache: :no_responses_count

  def display_type
    "No"
  end
end
