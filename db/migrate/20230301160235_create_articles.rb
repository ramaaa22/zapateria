class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :num
      t.integer :stock
      t.integer :price
      t.references :model, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.string :cod

      t.timestamps
    end
  end
end
