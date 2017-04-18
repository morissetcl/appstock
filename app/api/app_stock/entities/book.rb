module AppStock
  module Entities
    class Book < Grape::Entity
      expose :id
      expose :isbn
      expose :title
      expose :quantity
    end
  end
end
