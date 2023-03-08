class Article < ApplicationRecord
  belongs_to :model
  belongs_to :color
  has_one :brand, through: :model

  validates :num , presence: true, numericality: { in:15..45}
  validates :stock, presence: true, numericality: {in: 0..99 }
  validates :price, presence: true
  validates :model_id , inclusion: Model.all.ids
  validates :color_id , inclusion: Color.all.ids

  def get_code
    model = Model.find(model_id)
    brand = Brand.find(model.brand_id)
    color = Color.find(color_id)
    cod = brand.cod + model.cod + color.cod + num.to_s
  end

  def exists?(num)
    article = Article.where(num: num, color: color.id, model: model.id)
    !article.empty?
  end
  
end
