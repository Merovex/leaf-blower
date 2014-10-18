json.array!(@bonums) do |bonum|
  json.extract! bonum, :id, :boy_id, :rank_id, :name, :reported_by, :summary, :service, :heritage, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :nights
  json.url bonum_url(bonum, format: :json)
end
