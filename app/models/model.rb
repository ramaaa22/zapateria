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
  validates :brand_id , inclusion: Brand.all.ids
  validates :category_id, inclusion: Category.all.ids
  validates_with ModelValidator


  def get_brands
    @brands = Brand.all
  end

  def brand_with_model
    "#{brand.name} - #{cod}"
  end

  scope :ordered, -> { includes(:brand).order('brands.cod ASC').order(:cod) }

  scope :with_articles, -> {joins(:articles).where('stock > ?', 0).group(:model_id)}


end
