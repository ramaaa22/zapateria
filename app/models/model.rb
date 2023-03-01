class Model < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name , presence: true
  validates :cod , presence: true , numericality: { in: 0..999 }
end
