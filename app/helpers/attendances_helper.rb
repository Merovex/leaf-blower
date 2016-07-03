module AttendancesHelper
	def dc(a)
		raise a.inspect
	end
	def get_row()
		@i = 0 if @i.nil?
		return @i
	end
	def count_attendee()
		@i += 1
	end
end
