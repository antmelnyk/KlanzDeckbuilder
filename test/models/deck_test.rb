require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  def setup
    @deck = Deck.new
    @user = User.new
  end

  test 'deck with no params is invalid' do
    assert_not @deck.valid?
  end

  test 'deck with less then 15 cards is invalid' do
    @deck.user = @user
    @deck.name = 'Test'
    @deck.deck = '123_234_345_456_'
    assert_not @deck.valid?
  end

  test 'deck with no name is invalid' do
    @deck.user = @user
    @deck.deck = '123_234_345_456_123_234_345_456_123_234_345_456_123_234_345_'
    assert_not @deck.valid?
  end

  test 'deck with no user is invalid' do
    @deck.deck = '123_234_345_456_123_234_345_456_123_234_345_456_123_234_345_'
    @deck.name = 'Test'
    assert_not @deck.valid?
  end

  test 'deck is valid with user, name and 15 cards' do
    @deck.user = @user
    @deck.deck = '123_234_345_456_123_234_345_456_123_234_345_456_123_234_345_'
    @deck.name = 'Test'
    assert @deck.valid?
  end
end

