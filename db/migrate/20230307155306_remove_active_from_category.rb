class RemoveActiveFromCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories , :active

  end
end
