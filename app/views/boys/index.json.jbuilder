json.array!(@boys) do |boy|
  json.extract! boy, :id, :name, :current_rank_id, :patrol_id
  json.url boy_url(boy, format: :json)
end
