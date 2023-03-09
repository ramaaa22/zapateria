class LineItem < ApplicationRecord
  belongs_to :article
  belongs_to :cart, optional: true
  belongs_to :order, optional: true


  def total_price
    article.price * quantity
  end

end
