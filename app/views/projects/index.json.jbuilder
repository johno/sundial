json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :color, :user_id
  json.url project_url(project, format: :json)
end
