json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :name, :is_admin
  json.url user_url(user, format: :json)
end
