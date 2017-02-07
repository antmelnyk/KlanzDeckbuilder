module StaticPagesHelper
  def get_startime(card)
    startime = {
        786 => Time.new(2017, 2, 1), # Вью
        1141 => Time.new(2017, 2, 9), # Света
        732 => Time.new(2017, 2, 23), # Тандер
        171 => Time.new(2017, 3, 2), # Нифф
        500 => Time.new(2017, 3, 25), # Крампус
    }
    date = startime[card.id].to_f * 1000
  end
end
