module StaticPagesHelper
  def get_startime(card)
    startime = {
        787 => Time.new(2017, 2, 1), # Вью
        1142 => Time.new(2017, 2, 9), # Света
        733 => Time.new(2017, 2, 23), # Тандер
        171 => Time.new(2017, 3, 2), # Нифф
        501 => Time.new(2017, 3, 25), # Крампус
    }
    date = startime[card.id].to_f * 1000
  end
end
