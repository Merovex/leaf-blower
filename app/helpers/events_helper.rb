module EventsHelper
	def leaf_form(f,branch)
		return f.input branch
		# return f.input branch.to_sym, as: :select, :item_wrapper_class => 'inline', collection: [0,1,2,3,5 ], default: 0
	end
	def event_dtg(e)
		start = e.starts_at.strftime('%d %b %Y @ %H:%M')
		return start.html_safe
		if e.starts_at + 4.hours < e.ends_at
			# start = e.starts_at.strftime('%d %b %Y @ %H:%M')
			finish = "&ndash;" + e.ends_at.strftime('%d %b %Y')
		else
			# start = e.starts_at.strftime('%d %b %Y')
		end
		return "#{start}#{finish}".html_safe
		# return e.starts_at.strftime('%d %b %Y')
	end
	def leaf_list(obj)
		output = [
			["Svc", "Service", obj.service],
			["Hrg", "Heritage", obj.heritage],
			["Hob", "Hobbies", obj.hobbies],
			["Lif", "Life Skills", obj.life_skills],
			["Out", "Outdoor Activities", obj.outdoor_activities],
			["Pin", "Pioneer Skills", obj.pioneer_skills],
			["S&T", "Science & Technology", obj.sci_tech],
			["Val", "Values", obj.values	]	
		].map do |leaf|
			next if leaf.last.nil? or leaf.last.zero?
			"#{leaf[1]}  (#{leaf.last})"
		end
		return output.join("\n").html_safe
	end
	def leaf_header(obj)
		output = [
			["Svc", "Service", obj.service],
			["Hrg", "Heritage", obj.heritage],
			["Hob", "Hobbies", obj.hobbies],
			["Lif", "Life Skills", obj.life_skills],
			["Out", "Outdoor Activities", obj.outdoor_activities],
			["Pin", "Pioneer Skills", obj.pioneer_skills],
			["S&T", "Science & Technology", obj.sci_tech],
			["Val", "Values", obj.values	]	
		].map do |leaf|
			next if leaf.last.nil? or leaf.last.zero?
			"<tr><th><abbr title='#{leaf[1]}'>#{leaf.first.titlecase}</abbr></th><td>#{leaf.last}</td></tr>"
		end
		return output.join("\n").html_safe
	end
	def leaf_list_item(obj)
		output = [
			["Service", obj.service],
			["Heritage", obj.heritage],
			["Hobbies", obj.hobbies],
			["Life Skills", obj.life_skills],
			["Outdoor Activities", obj.outdoor_activities],
			["Pioneer Skills", obj.pioneer_skills],
			["Science & Technology", obj.sci_tech],
			["Values", obj.values	]	
		].map do |leaf|
			next if leaf.last.nil? or leaf.last.zero?
			"<li class='list-group-item'>#{leaf.first.titlecase} (#{leaf.last})</li>"
		end
		return output.join("\n").html_safe
	end
	def leaf_header_full(obj)
		output = [
			["Service", obj.service],
			["Heritage", obj.heritage],
			["Hobbies", obj.hobbies],
			["Life Skills", obj.life_skills],
			["Outdoor Activities", obj.outdoor_activities],
			["Pioneer Skills", obj.pioneer_skills],
			["Science & Technology", obj.sci_tech],
			["Values", obj.values	]	
		].map do |leaf|
			next if leaf.last.nil? or leaf.last.zero?
			"<tr><th>#{leaf.first.titlecase}</th><td>#{leaf.last}</td></tr>"
		end
		return output.join("\n").html_safe
	end
end
