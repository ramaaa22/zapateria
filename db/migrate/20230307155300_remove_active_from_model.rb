class RemoveActiveFromModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :models , :active

  end
end
