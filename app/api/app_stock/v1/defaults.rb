module API::AppStock::V1::Defaults
  extend ActiveSupport::Concern

  included do
    # common Grape settings
    version 'v1', using: :path
    format :json
    formatter :json, PrettyJSON
    prefix :api

    end
  end
# Custom formatting to display "pretty" JSON data
module PrettyJSON
  def self.call(object, env)
    JSON.pretty_generate(JSON.parse(object.to_json))
  end
end
