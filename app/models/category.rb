class Category < ApplicationRecord
    has_many :models, :dependent => :restrict_with_error


    validates :cod , presence: true , uniqueness: true, numericality: { only_integer: true }, length: { is: 2}
    validates :name , presence: true , uniqueness: true , length: { minimum: 3, maximum: 10}
end
