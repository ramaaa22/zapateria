class AddNameToColor < ActiveRecord::Migration[7.0]
  def change
    add_column :colors, :name, :string
  end
end
