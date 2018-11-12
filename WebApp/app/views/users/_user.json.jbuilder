json.extract! user, :id, :name, :lastname, :username, :email, :age, :university, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
