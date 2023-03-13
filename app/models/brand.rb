class Brand < ApplicationRecord
    has_many :models,  :dependent => :restrict_with_error

    validates :cod , presence: true , uniqueness: true, length: { is: 2}, format: {with: /[A-Z]/}
    validates :name , presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}


end
