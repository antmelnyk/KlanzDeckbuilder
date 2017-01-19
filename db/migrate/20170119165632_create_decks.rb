class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :deck
      t.string :author
      t.integer :likes
      t.integer :dislikes
    end
  end
end
