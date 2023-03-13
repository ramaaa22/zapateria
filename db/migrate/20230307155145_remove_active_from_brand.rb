class RemoveActiveFromBrand < ActiveRecord::Migration[7.0]
  def change
    remove_column :brands , :active
  end
end
