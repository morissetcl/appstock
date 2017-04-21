module AppStock
  module V1
    class Books < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :books do
        desc 'Return list of books'
        get do
          {id: params[:isbn]}
          books = Book.all
          present books, with: AppStock::Entities::Index # use index entities to display correct data
        end

        desc "Return a book"
        route_param :isbn do
          get do
            {id: params[:isbn]} # find by Isbn instead Id
            book = Book.friendly.find(params[:isbn])
            present book, with: AppStock::Entities::Book
          end

          resource :flows do
            desc 'Create a flow.'
            params do
              requires :flow, type: Hash do
                requires :newQuantity, type: Integer, desc: 'New Stock.'
                requires :oldQuantity, type: Integer, desc: 'Previous Stock.'
                optional :comment, type: String, desc: 'Comment about new stock.'
              end
            end
            post do
              {id: params[:isbn]} # find by Isbn instead Id
              @book = Book.friendly.find(params[:isbn])
              @flow = Flow.new(params[:flow])
              @flow = @book.flows.create(params[:flow])
              @book.update(quantity: @flow.newQuantity)
            end
          end
        end
      end
    end
  end
end
