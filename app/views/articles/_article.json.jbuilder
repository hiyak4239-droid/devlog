json.extract! article, :id, :title, :content, :summary, :category, :tags, :published, :created_at, :updated_at
json.url article_url(article, format: :json)
