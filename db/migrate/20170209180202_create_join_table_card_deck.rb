class CreateJoinTableCardDeck < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cards, :decks do |t|
      t.index [:deck_id, :card_id]
    end
  end
end
