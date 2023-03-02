class Model < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :articles

  validates :name , presence: true
  validates :cod , presence: true , numericality: { only_integer: true }, length: { is: 3}


end
