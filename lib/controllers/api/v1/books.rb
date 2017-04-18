module AppStock
  module API
    module V1
      class Books < Grape::API
        params do
      	  optional :name, type: String, desc: 'Company name you wish to filter on'
      	end
      	resource :books do
      	  desc "Retrieve a list of Books"
      	  get do
      	  	Book.all
      	  end
      	end

      end
    end
  end
end
