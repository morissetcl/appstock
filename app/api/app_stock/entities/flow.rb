module AppStock
  module Entities
    class Flow < Grape::Entity
      expose :id
      expose :newQuantity
      expose :oldQuantity
      expose :created_at
    end
  end
end
