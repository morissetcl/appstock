module AppStock
  module V1
    class Books < Grape::API
      include V1::Defaults


      resource :books do
        desc "Return list of books"
        get do
          books = Book.all
          present books
        end

        desc "Return a book"
        params do
          requires :id, type: Integer, desc: "Book id"
        end
        route_param :id do
          get do
            book = Book.find(params[:id])
            present book, with: AppStock::Entities::Book
          end

          resource :flows do
            desc 'Create a flow.'
            params do
              requires :flow, type: Hash do
                requires :newQuantity, type: Integer, desc: 'New Stock.'
                requires :oldQuantity, type: Integer, desc: 'Previous Stock.'
              end
            end
            post do
              @book = Book.find(params[:id])
              @flow = Flow.new(params[:flow])
              if @flow = @book.flows.create!(params[:flow])
                 @book.update(quantity: @flow.newQuantity)
              end
              puts params.inspect
            end
          end
        end


      end
    end
  end
end
