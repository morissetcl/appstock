module AppStock
  module V1
    class Books < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api


      resource :books do
        desc "Return list of books"
        # Récupération de la collection de toutes les voitures grâce à ActiveRecord
        get do
          books = Book.all
          present books, with: AppStock::Entities::Book
        end

        desc "Return a book"
        # Récupération d'une voiture spécifique grâce au paramètre passé dans l'url
        params do
          requires :id, type: Integer, desc: "Book id"
        end
        route_param :id do
          get do
            Book.find(params[:id]).flows
          end
        end
      end
    end
  end
end
