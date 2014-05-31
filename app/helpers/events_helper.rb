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
end
