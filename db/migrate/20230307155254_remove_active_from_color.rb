class RemoveActiveFromColor < ActiveRecord::Migration[7.0]
  def change
    remove_column :colors , :active

  end
end
