require 'test_helper'

class DeckInteractionsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:test)
    sign_in @user
    @user.confirmed_at = Time.zone.now
  end

  test "user can create deck" do
    get cards_path
    assert_response :success
    assert_difference('Deck.count') do
      post decks_path, params: { deck: { name: "test deck", info: "", room: 'Арена',
                            deck: "1787_1765_1710_1700_1556_1442_1413_1395_1247_1115_1039_1026_974_943_904_" } }
    end
    assert_equal Deck.last, Deck.find_by(name: "test deck")
    get deck_path(Deck.last)
    assert_response :success
    assert_select "h4", "test deck"
  end

end

