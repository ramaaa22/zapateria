class Color < ApplicationRecord
    has_many :articles, :dependent => :restrict_with_error
    #before_destroy :check_articles
    validates :cod , presence: true , uniqueness: true, numericality: { only_integer: true }, length: { is: 2}
    validates :name , presence: true, uniqueness: true, length: {minimum: 1, maximum: 10}

    def check_articles
        if !articles.empty?
            errors.add_to_base("Cannot delete color #{name} ")
            return false
        end
    end
end
