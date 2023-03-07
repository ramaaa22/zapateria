class Model < ApplicationRecord

  class ModelValidator < ActiveModel::Validator
    def validate(record)
      found = Model.find_by(cod: record.cod, brand: record.brand)
      if (found && found.id!=record.id)
        record.errors.add :base, "The model '#{record.cod}' for brand '#{record.brand.cod}' exists"
      end
    end
  end

  belongs_to :brand
  belongs_to :category
  has_many :articles, :dependent => :restrict_with_error

  validates :name , presence: true
  validates :cod , presence: true , numericality: { only_integer: true }, length: { is: 3}
  validates :brand, presence:true
  validates :category, presence:true
  validates_with ModelValidator

end
