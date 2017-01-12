class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :card_id
      t.string :name
      t.string :clan
      t.string :rarity
      t.boolean :star
      t.integer :power
      t.integer :damage
      t.string :ability
      t.string :bonus

      t.timestamps
    end
  end
end
