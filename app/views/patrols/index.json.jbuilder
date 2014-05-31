json.array!(@patrols) do |patrol|
  json.extract! patrol, :id, :name, :pack_id
  json.url patrol_url(patrol, format: :json)
end
