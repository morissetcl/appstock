class Book < ApplicationRecord
  has_many :flows
  attr_accessor :title, :quantity
end
