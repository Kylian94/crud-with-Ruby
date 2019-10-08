json.extract! article, :id, :title, :desc, :created_at, :updated_at
json.url article_url(article, format: :json)
