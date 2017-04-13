class FlowsController < ApplicationController

  def index
    set_book
    @flow = Flow.where(book_id: @book)
  end

  def create
    @flow = Flow.new(flow_params)
    @book = Book.find(params[:book_id])
    @flow.book = @book
    if @flow.save
      @book.update(quantity: @flow.newQuantity)
      redirect_to book_path(@book)
    else
      redirect_to book_path(@book)
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def flow_params
    params.require(:flow).permit(:oldQuantity, :newQuantity)
  end

end
