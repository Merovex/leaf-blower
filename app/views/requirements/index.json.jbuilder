json.array!(@requirements) do |requirement|
  json.extract! requirement, :id, :name, :text, :badge_id
  json.url requirement_url(requirement, format: :json)
end
