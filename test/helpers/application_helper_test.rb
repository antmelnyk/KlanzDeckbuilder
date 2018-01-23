require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test 'card path helper' do
    assert_equal 'cards_jpg/122.jpg', card_art_path(122)
    assert_equal 'cards_png/45.png', card_art_path(45)
    assert_equal '1759.gif', card_art_path(1759)
  end

  test 'clan id helper' do
    assert_equal 11, clan_id('Saints')
    assert_equal 26, clan_id('Nemos')
  end

  test 'clan name helper' do
    assert_equal 'Damned', clan_name(10)
    assert_equal 'Chasers', clan_name(18)
  end
end
