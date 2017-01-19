module ApplicationHelper
  def card_path(id)
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root +
        "app/assets/images/cards_jpg/#{id}.jpg")
    return "cards_jpg/#{id}.jpg" if File.file? (Rails.root +
        "app/assets/images/cards_jpg/#{id}")
    return "cards_png/#{id}.png" if File.file? (Rails.root +
        "app/assets/images/cards_png/#{id}.png")
    "#{id}.gif"
  end
end
