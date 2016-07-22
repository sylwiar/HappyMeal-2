class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price
      t.references :order, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
    add_index :meals, :order_id
    add_index :meals, :user_id
  end
end
