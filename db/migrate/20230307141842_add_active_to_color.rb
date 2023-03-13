class AddActiveToColor < ActiveRecord::Migration[7.0]
  def change
    add_column :colors, :active, :boolean, default: true
  end
end
