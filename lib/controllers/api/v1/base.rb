module AppStock
  module API
    module V1
      class Base < Grape::API
        mount AppStock::API::V1::Books
      end
    end
  end
end
