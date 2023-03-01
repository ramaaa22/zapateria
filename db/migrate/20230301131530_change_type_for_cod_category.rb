class ChangeTypeForCodCategory < ActiveRecord::Migration[7.0]
  def change
    change_column(:categories, :cod, :string)
  end
end
