class RemoveColumnCodForArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles , :cod
  end
end
