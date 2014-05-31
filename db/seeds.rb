# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Locations

Location.create(:name => "Immanuel Bible Church", :address => "6911 Braddock Rd, Springfield, VA 22151")

Pack.create(:name => "VA-1115", :location_id => 1)

@boys = {
	'Fox' => {
		'Cooper Aldrich' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Matthew Doe' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Joshual Dryjanski' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Caleb Moore' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	},
	'Hawk' => {
		'Aidan Baxter' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Lee Beltran' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Jared Crestetto' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Sam Colletti' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Thomas Dryjanski' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'William Hannesschalger' => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Joel Heacock' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Joshua Hoyle' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Daniel Kendrick' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'William McFarland' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Curtis Moore' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Michael Ohaneson' => 		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		'Drake Ryan' => 			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	},
	'Lion' => {
		'Brady Aldrich' => 		[0,0,0,0,0,1,1,1,1,1,0,1,0,0,0,0,0],
		'Hudson Bartolomei' => 	[0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0],
		'Asa Gleeson' => 		[1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0],
		'Daniel Hess' => 		[1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,0,0],
		'Samuel Kendrick' => 	[1,1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,0],
		'Silas Ketcham' => 		[1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0],
		'Gabriel Mateo' => 		[1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0],
		'Gabriel Pease' => 		[0,0,0,0,0,0,1,1,1,0,1,0,0,0,0,0,0],
		'Steven Reese' => 		[0,0,0,0,1,1,1,0,1,1,1,1,0,0,0,0,0],
		'Nathan Wilson' => 		[1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0]
	}
}

puts "Populating Patrol:"

@kids = {}
@patrols = {}
["Fox", "Hawk", "Lion"].each do |rank|
	puts " - Creating '#{rank}' Patrol"
	patrol = Patrol.create(:name => rank, :pack_id => 1, :rank => rank.downcase)
	@boys[rank].keys.each do |name|
		puts "  -- Creating '#{name}'"
		@kids[name] = patrol.boys.create(:name => name)
		@kids[name].set_current_rank
	end
end
days = [
	"2014-01-06",
	"2014-01-13",
	# "2014-01-20", MLKJ Day
	"2014-01-27",
	"2014-02-03",
	"2014-02-10",
	# "2014-02-17", President's Day
	"2014-02-24",
	# "2014-03-03", Snow Day
	"2014-03-10",
	# "2014-03-17", Snow Day
	"2014-03-24",
	"2014-03-31",
	"2014-04-07",
	# "2014-04-14", Spring Break
	"2014-04-21",
	"2014-04-28",
	"2014-05-05",
	"2014-05-12",
	"2014-05-19",
	# "2014-05-26", Memorial Day
	"2014-06-02"]

# puts "Creating Events"

# ["Fox", "Hawk"].each do |patrol|
# 	puts "-- #{patrol} Events"
# 	days.each do |date|
# 		puts "   -- #{date}"
# 		# Event.create(:name => "#{patrol} Patrol Meeting", :start => date, :finish => date, :heritage => 1)
# 	end
# end





# puts "Creating Lion Events"
@events = []
@events << Event.create(:name => "Lion Patrol Meeting - January 6", :start => "2014-01-06", :finish => "2014-01-06", :values => 2);
@events << Event.create(:name => "Lion Patrol Meeting - January 13", :start => "2014-01-13", :finish => "2014-01-13", :values => 2);
@events << Event.create(:name => "Lion Patrol Meeting - January 27", :start => "2014-01-27", :finish => "2014-01-27", :hobbies => 2);
@events << Event.create(:name => "Lion Patrol Meeting - February 3", :start => "2014-02-03", :finish => "2014-02-03", :heritage => 2);
@events << Event.create(:name => "Lion Patrol Meeting - February 10", :start => "2014-02-10", :finish => "2014-02-10", :heritage => 1, :hobbies => 1);
@events << Event.create(:name => "Lion Patrol Meeting - February 24", :start => "2014-02-24", :finish => "2014-02-24", :heritage => 2);
@events << Event.create(:name => "Lion Patrol Meeting - March 10", :start => "2014-03-10", :finish => "2014-03-10", :pioneer_skills => 2);
@events << Event.create(:name => "Lion Patrol Meeting - March 24", :start => "2014-03-24", :finish => "2014-03-24", :pioneer_skills => 2);
@events << Event.create(:name => "Lion Patrol Meeting - March 31", :start => "2014-03-31", :finish => "2014-03-31", :pioneer_skills => 2);
@events << Event.create(:name => "Lion Patrol Meeting - April 7", :start => "2014-04-07", :finish => "2014-04-07", :life_skills => 2);
@events << Event.create(:name => "Lion Patrol Meeting - April 21", :start => "2014-04-21", :finish => "2014-04-21", :life_skills => 2);
@events << Event.create(:name => "Lion Patrol Meeting - April 28", :start => "2014-04-28", :finish => "2014-04-28", :outdoor_activities => 2);
@events << Event.create(:name => "Lion Patrol Meeting - May 5", :start => "2014-05-05", :finish => "2014-05-05", :values => 2);
@events << Event.create(:name => "Lion Patrol Meeting - May 12", :start => "2014-05-12", :finish => "2014-05-12", :values => 2);
@events << Event.create(:name => "Lion Patrol Meeting - May 19", :start => "2014-05-19", :finish => "2014-05-19", :values => 2);
@events << Event.create(:name => "Lion Patrol Meeting - June 2", :start => "2014-06-02", :finish => "2014-06-02", :values => 2);

@events.each do |event|
	@boys['Lion'].keys.each do |name|
		s = @boys['Lion'][name].shift
		next unless s == 1
		@kids[name].events << event
		# Attendance.create(:boy_id => boy.id, :event_id => e.id)
	end
end

# puts "Populating Boy's Attendance"
# Boy.where(patrol_id: 3).each do |boy|
# 	# puts boy.current_rank.inspect
# 	# @events.each do |e|
# 	# 	attended = boys
# 	# 	puts Attendance.create(:boy_id => boy.id, :event_id => e.id)
# 	# end
# end