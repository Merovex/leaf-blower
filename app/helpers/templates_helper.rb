module TemplatesHelper
	def template_params(t)
		p = {
			:life_skills => t.life_skills,
		 	:heritage => t.heritage,
		 	:hobbies => t.hobbies,
		 	:pioneer_skills => t.pioneer_skills,
		 	:life_skills => t.life_skills,
		 	:values => t.values,
		 	:outdoor_activities => t.outdoor_activities
		 }
		return p
	end
end
