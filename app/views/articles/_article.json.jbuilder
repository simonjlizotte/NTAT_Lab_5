json.extract! article, :id, :title, :content, :user_id, :comments, :created_at, :updated_at
json.url article_url(article, format: :json)
