class Order < ApplicationRecord
    has_many :line_items

    validates :name , presence: true


    def add_articles_in_cart(cart)
        cart.line_items.each do |line_item|
            line_item.cart_id = nil
            article = line_item.article
            article.stock -= line_item.quantity
            article.save
            line_items << line_item
        end
    end


end
