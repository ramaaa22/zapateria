class RemoveActiveFromArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles , :active

  end
end
