class AddActiveToArticle < ActiveRecord::Migration[7.0]
  def change
    change_column(:articles, :active, :boolean, default:true)
  end
end
