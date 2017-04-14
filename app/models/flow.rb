class Flow < ApplicationRecord
  belongs_to :book

  validates :newQuantity, presence: true
  validates :oldQuantity, presence: true


  def self.bookFlows(a)
   self.where(book_id: a)
 end

end
