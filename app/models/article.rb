class Article < ApplicationRecord
  belongs_to :model
  belongs_to :color

  validates :num , presence: true, numericality: { in:15..45}
  validates :stock, presence: true, numericality: {in: 0..99 }
  validates :price, presence: true
end
