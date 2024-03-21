class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.integer :category_id
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
