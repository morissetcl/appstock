class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :bookFlows, only: [:show]

  def index
    @books = Book.all
  end

  def show
    @flow = Flow.new
    # @previousQuantity1 = @flows.empty? ? '0' : @flows.last.newQuantity
    @previousQuantity = @book.flows.last.newQuantity

  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :quantity)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def bookFlows
    @flows = @book.flows
  end

end
