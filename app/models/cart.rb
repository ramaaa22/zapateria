class Cart < ApplicationRecord
    has_many :line_items, dependent: :delete_all
    #belongs_to :cart, optional: true
    belongs_to :user

    def add_article(article)
        current_article = line_items.find_by(article_id: article.id)

        if current_article
            if article.stock > current_article.quantity
                current_article.quantity +=1
            else
                return false
            end

        else
            current_article = line_items.build(article_id: article.id)
            current_article.quantity = 1
        end
        current_article
    end

    def total_price
        sum = 0
        line_items.each do |line_item|
            sum += line_item.total_price
        end
        sum
    end
    
end
