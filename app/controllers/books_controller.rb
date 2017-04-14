class BooksController < ApplicationController
  before_action :set_book, only: [ :show]

  def index
    @books = Book.all
  end

  def show
    @flow = Flow.new
    @flows = Flow.bookFlows(@book.id)
    @previous_quantity = @flows.empty? ? '0' : @flows.last.newQuantity
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :quantity)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
