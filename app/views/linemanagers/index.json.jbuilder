json.array!(@linemanagers) do |linemanager|
  json.extract! linemanager, :id, :line_manager_id, :user_id
  json.url linemanager_url(linemanager, format: :json)
end
