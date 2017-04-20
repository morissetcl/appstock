module AppStock
  module Entities
    class Index < Grape::Entity
      expose :isbn
      expose :title
      expose :quantity
    end
  end
end
