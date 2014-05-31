json.array!(@ranks) do |rank|
  json.extract! rank, :id, :name, :boy_id, :is_current, :service, :heritage, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :start, :finish, :awarded
  json.url rank_url(rank, format: :json)
end
