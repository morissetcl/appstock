class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :isbn, use: :slugged

  has_many :flows
end
