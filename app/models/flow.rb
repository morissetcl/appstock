class Flow < ApplicationRecord
  belongs_to :book

  validates :newQuantity, presence: :true, allow_blank: :false
  validates :oldQuantity, presence: :true, allow_blank: :false
end
