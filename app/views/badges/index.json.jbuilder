json.array!(@badges) do |badge|
  json.extract! badge, :id, :name, :description, :rank_id
  json.url badge_url(badge, format: :json)
end
