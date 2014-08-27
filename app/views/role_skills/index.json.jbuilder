json.array!(@role_skills) do |role_skill|
  json.extract! role_skill, :id
  json.url role_skill_url(role_skill, format: :json)
end
