module AppStock
  module Entities
    class Book < Grape::Entity
      acts_as_token_authentication_handler_for User, except: [ :index, :show ]

      expose :id
      expose :isbn
      expose :title
      expose :quantity
      expose :flows, using: AppStock::Entities::Flow

      def update
    if book.update(book_params)
      render :show
    else
      render_error
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :quantity)
  end

  def render_error
    render json: { errors: book.errors.full_messages },
      status: :unprocessable_entity
  end

    end
  end
end
