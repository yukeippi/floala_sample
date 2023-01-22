json.extract! user, :id, :name, :memo, :created_at, :updated_at
json.url user_url(user, format: :json)
