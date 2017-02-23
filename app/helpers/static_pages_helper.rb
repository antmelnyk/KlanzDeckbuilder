module StaticPagesHelper
  def get_startime(card)
    startime = {
        1771 => Time.new(2017, 3, 25), # Крампус
        1779 => Time.new(2017, 2, 23), # Тандер
        1781 => Time.new(2017, 3, 1), # Нифф
        1807 => Time.new(2017, 5, 10), # Илья
        1805 => Time.new(2017, 3, 17) # Мастер
    }
    date = startime[card.number].to_f * 1000
  end
end
