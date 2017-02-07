module StaticPagesHelper
  def get_startime(card)
    startime = {
        1769 => Time.new(2017, 2, 1), # Вью
        1778 => Time.new(2017, 2, 9), # Света
        1779 => Time.new(2017, 2, 23), # Тандер
        1781 => Time.new(2017, 3, 2), # Нифф
        1771 => Time.new(2017, 3, 25), # Крампус
    }
    date = startime[card.number].to_f * 1000
  end
end
