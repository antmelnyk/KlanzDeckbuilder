class Deck < ApplicationRecord
  validates :deck, presence: true
end
