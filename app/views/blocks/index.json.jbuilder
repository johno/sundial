json.array!(@blocks) do |block|
  json.extract! block, :id, :started_at, :ended_at, :task_id
  json.url block_url(block, format: :json)
end
