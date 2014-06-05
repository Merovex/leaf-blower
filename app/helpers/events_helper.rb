module EventsHelper
	def leaf_form(f,branch)
		return f.input branch.to_sym, as: :select, :item_wrapper_class => 'inline', collection: [0,1,2,3,5 ], default: 0
	end
	def event_dtg(e)
		start = e.starts_at.strftime('%d %b %Y @ %H:%M')
		if e.starts_at + 4.hours < e.ends_at
			# start = e.starts_at.strftime('%d %b %Y @ %H:%M')
			finish = "&ndash;" + e.ends_at.strftime('%d %b %Y')
		else
			# start = e.starts_at.strftime('%d %b %Y')
		end
		return "#{start}#{finish}".html_safe
		# return e.starts_at.strftime('%d %b %Y')
	end
	def leaf_header(event)
		output = [
			["Svc", "Service", event.service],
			["Hrg", "heritage", event.heritage],
			["Hob", "Hobbies", event.hobbies],
			["Lif", "Life Skills", event.life_skills],
			["Out", "Outdoor Activities", event.outdoor_activities],
			["Pin", "Pioneer Skills", event.pioneer_skills],
			["S&T", "Science & Technology", event.sci_tech],
			["Val", "Values", event.values	]	
		].map do |leaf|
			next if leaf.last.nil? or leaf.last.zero?
			"<tr><th><abbr title='#{leaf[1]}'>#{leaf.first}</abbr></th><td>#{leaf.last}</td></tr>"
		end
		return output.join("\n").html_safe
	 
	end
end
