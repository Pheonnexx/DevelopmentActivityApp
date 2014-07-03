json.array!(@dev_activities) do |dev_activity|
  json.extract! dev_activity, :id
  json.url dev_activity_url(dev_activity, format: :json)
end
