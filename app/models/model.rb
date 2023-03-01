class Model < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name , presence: true
  validates :cod , presence: true , uniqueness: true, numericality: { only_integer: true }, length: { is: 3}

end
