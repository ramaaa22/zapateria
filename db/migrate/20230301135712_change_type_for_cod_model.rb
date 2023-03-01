class ChangeTypeForCodModel < ActiveRecord::Migration[7.0]
  def change
    change_column(:models, :cod, :string)
  end
end
