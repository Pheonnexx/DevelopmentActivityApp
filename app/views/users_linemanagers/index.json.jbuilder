json.array!(@users_linemanagers) do |users_linemanager|
  json.extract! users_linemanager, :id
  json.url users_linemanager_url(users_linemanager, format: :json)
end
