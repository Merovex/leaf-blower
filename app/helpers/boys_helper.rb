module BoysHelper
	def show_leaves(i)
		i ||= 10
		return "#{["*"] * i * ' '}".html_safe
	end
end
