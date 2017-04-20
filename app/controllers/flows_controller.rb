class FlowsController < ApplicationController
  before_action :set_book, only: [:index]

  def index
    @flow = Flow.where(book_id: @book)
  end

  def create
    @book = Book.friendly.find(params[:book_id])
    @flow = Flow.new(flow_params)
    @flow = @book.flows.build(flow_params)
    @flow.book = @book
    if @flow.save
      @book.update(quantity: @flow.newQuantity)
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { render "flows/show" }
        format.js { }
      end
    end
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def flow_params
    params.require(:flow).permit(:oldQuantity, :newQuantity)
  end

end
