module AppStock
  class Base < Grape::API
    mount AppStock::V1::Books

    def clean_params(params)
      ActionController::Parameters.new(params)
    end

    

  end
end
