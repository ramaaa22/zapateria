class Color < ApplicationRecord
    validates :cod , presence: true , uniqueness: true, numericality: { only_integer: true }, length: { is: 2}
    validates :name , presence: true, uniqueness: true, length: {minimum: 1, maximum: 10}
end
