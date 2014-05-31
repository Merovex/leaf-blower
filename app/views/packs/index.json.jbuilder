json.array!(@packs) do |pack|
  json.extract! pack, :id, :name, :location_id
  json.url pack_url(pack, format: :json)
end
