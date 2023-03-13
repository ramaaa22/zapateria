class AddCodToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :cod, :string
  end
end
