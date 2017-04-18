class Book < ApplicationRecord
  has_many :flows
  belongs_to :user
end
