json.array!(@templates) do |template|
  json.extract! template, :id, :name, :description, :heritage, :hobbies, :outdoor_activities, :pioneer_skills, :sci_tech, :life_skills, :values, :life_skills, :service_hours, :rank
  json.url template_url(template, format: :json)
end
