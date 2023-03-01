json.extract! article, :id, :num, :stock, :price, :model_id, :color_id, :cod, :created_at, :updated_at
json.url article_url(article, format: :json)
