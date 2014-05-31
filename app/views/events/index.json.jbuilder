json.array!(@events) do |event|
  json.extract! event, :id, :name, :location_id, :service, :heritage, :hobbies, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :start, :finish, :description
  json.url event_url(event, format: :json)
end
