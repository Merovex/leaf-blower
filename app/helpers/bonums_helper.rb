module BonumsHelper
	def micon(i,side='')
		side = " #{side}" unless side == ''
		return raw("<i class='material-icons#{side}'>#{i}</i>")
	end
end
