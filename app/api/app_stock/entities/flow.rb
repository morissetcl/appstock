module AppStock
  module Entities
    class Flow < Grape::Entity
      expose :newQuantity
      expose :oldQuantity
      expose :comment
      expose :created_at
    end
  end
end
