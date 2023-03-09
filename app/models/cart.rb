class Cart < ApplicationRecord
    has_many :line_items
    belongs_to :cart, optional: true

    def add_article(article)
        current_article = line_items.find_by(article_id: article.id)

        if current_article
            if article.stock > current_article.quantity
                current_article.quantity +=1
            end
        else
            current_article = line_items.build(article_id: article.id)
            current_article.quantity = 1
        end
        current_article
    end
    
end
