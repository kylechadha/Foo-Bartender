class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :alcohol
      t.string :mixer
      t.string :finish
      t.boolean :over_ice
      t.boolean :top_shelf
      t.integer :price

      t.timestamps
    end
  end
end
