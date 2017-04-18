module AppStock
  module Entities
    class Book < Grape::Entity
      expose :id
      expose :isbn
      expose :title
      expose :quantity
      expose :flows, using: AppStock::Entities::Flow
    end
  end
end
