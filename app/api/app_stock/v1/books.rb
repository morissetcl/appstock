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
          present books
        end

        desc "Return a book"
        # Récupération d'une voiture spécifique grâce au paramètre passé dans l'url
        params do
          requires :id, type: Integer, desc: "Book id"
        end
        route_param :id do
          get do
            book = Book.find(params[:id])
            present book, with: AppStock::Entities::Book
          end
        end
      end

      # desc "update a book author"
      # params do
      #   requires :id, type: Integer, desc: "Book Id"
      # end
      # route_param :id do
      #   patch do
      #   Book.find(params[:id]).update!({
      #     quantity:params[:quantity]
      #   })
      #   present book
      #   end
      # end


    end
  end
end
