class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :number
      t.string :name
      t.string :clan
      t.string :rarity
      t.boolean :star
      t.boolean :marketable, :default => true
      t.integer :power
      t.integer :damage
      t.string :ability
      t.string :bonus

      t.timestamps
    end
  end
end
