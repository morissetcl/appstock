class FlowsController < ApplicationController

  def index
    set_book
    @flow = Flow.where(book_id: @book)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

end
