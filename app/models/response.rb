class Response < ApplicationRecord
  RESPONSE_TYPE_MODELS = {
    "YesResponse" => "YesResponse",
    "NoResponse"  => "NoResponse"
  }.freeze

  belongs_to :survey
end
