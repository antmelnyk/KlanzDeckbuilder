class Deck < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 40 }
  VALID_DECK_REGEX = /\A([\d]+_){15,}\z/
  validates :deck, format: { with: VALID_DECK_REGEX }
  belongs_to :user
end
