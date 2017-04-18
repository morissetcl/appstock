module AppStock
  module API
    class Base < Grape::API
      prefix :api # set the url prefix
      format :json # define the format
      mount AppStock::API::V1::Base
    end
  end
end
