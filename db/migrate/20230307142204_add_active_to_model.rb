class AddActiveToModel < ActiveRecord::Migration[7.0]
  def change
    change_column(:models, :active, :boolean, default:true)
  end
end
