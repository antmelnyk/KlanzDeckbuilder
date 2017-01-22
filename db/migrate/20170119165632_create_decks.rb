class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :deck # Heck what? As this app is free fun project hosting on free Heroku dyno,
                     # I've decided do not make model interactions too complicated. Thus,
                     # cards in deck aren't connected to Card model, its just a string with cards ids
      t.text :info
      t.integer :likes
      t.integer :dislikes
      t.belongs_to :user, index: true
    end
  end
end
