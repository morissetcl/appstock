module AppStock
  module Entities
    class Book < Grape::Entity
      expose :id
      expose :isbn, :documentation => {:type => "integer", :desc => "The ISBN"}
      expose :title, :documentation => {:type => "string", :desc => "The title of the book"}
      expose :quantity, :documentation => {:type => "integer", :desc => "The current stock of book"}
      expose :flows, using: AppStock::Entities::Flow
    end
  end
end
