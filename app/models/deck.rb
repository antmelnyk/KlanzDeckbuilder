class Deck < ApplicationRecord
  validates :author, presence: true
  validates :deck, presence: true
end
