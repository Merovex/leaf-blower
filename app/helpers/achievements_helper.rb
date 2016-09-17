module AchievementsHelper
	def complete_date(a)
		if a.completed_on.nil?
			s = "#{link_to 'Mark Done', fine_achievement_path( a), :data => { :confirm => 'Are you sure?' }}"
		else
			s = "#{a.completed_on} / #{link_to 'undo', undo_achievement_path( a), :data => { :confirm => 'Are you sure?' }}"
		end
		return s.html_safe
	end
	def tooltip(t,d)
		raw "<span class='tooltipped' data-position='bottom' data-delay='50' data-tooltip='#{d}'>#{t}</span>"
	end
end
