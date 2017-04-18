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

        desc "Return a book with its flows"
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

      desc 'Delete a book.'
        params do
          requires :id, type: Integer, desc: 'Book id.'
        end
        route_param :id do
          delete do
            Book.find(params[:id]).destroy
          end
        end

        desc "update a book quantity"
    		params do
    		  requires :id, type: String
    		  requires :quantity, type: Integer
    		end
    		put ':id' do
    		  Book.find(params[:id]).update({
    		    quantity:params[:quantity]
    		  })
    		end

    end
  end
end
