class Order < ApplicationRecord
    has_many :line_items

    validates :name , presence: true


    def add_articles_in_cart(cart)
        cart.line_items.each do |line_item|
            line_item.cart_id = nil
            article = line_item.article
            article.transaction do
                article.stock -= line_item.quantity
                article.save
            end
            line_items << line_item
        end
    end

    def check_availability(cart)
        errors = []
        cart.line_items.each do |line_item|
            if line_item.quantity > line_item.article.stock
                errors.push(line_item.article)
            end
        end
        errors
    end

end
