json.extract! comment, :id, :created_at, :updated_at, :content
json.url comment_url(comment, format: :json)
