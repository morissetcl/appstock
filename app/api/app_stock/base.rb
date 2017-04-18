module AppStock
  class Base < Grape::API
    mount AppStock::V1::Books
  end
end
