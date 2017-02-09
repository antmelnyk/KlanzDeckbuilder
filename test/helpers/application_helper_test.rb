require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test 'card path helper' do
    assert_equal 'cards_jpg/123.jpg', card_path(123)
    assert_equal 'cards_png/1403.png', card_path(1403)
    assert_equal '1759.gif', card_path(1759)
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
