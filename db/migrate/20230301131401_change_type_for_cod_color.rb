class ChangeTypeForCodColor < ActiveRecord::Migration[7.0]
  def change
    change_column(:colors, :cod, :string)
  end
end
