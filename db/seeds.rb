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
Location.create(:name => "Camp Sandy Cove", :address => "RT 1 Box 471 High View, WV 26808")

Pack.create(:name => "VA-1115", :location_id => 1)

@boys = {
	'Fox' => {
		'Cooper Aldrich' => 		[0, 0,0,0, 0,0,0, 1,1,1, 1,1,0, 1,1,1, 0,0, 0,0,0, 0,0,0],
		'Matthew Doe' => 			[1, 1,1,1, 1,1,1, 1,1,1, 0,1,1, 0,1,1, 0,0, 0,0,0, 0,0,0],
		'Joshual Dryjanski' => 		[0, 0,1,1, 0,1,1, 0,1,0, 0,0,0, 0,0,0, 0,0, 0,0,0, 0,0,0],
		'Caleb Moore' => 			[0, 0,1,1, 1,1,1, 1,1,1, 1,1,1, 0,0,0, 0,0, 0,0,0, 0,0,0]
	}, # Foxes are current
	'Hawk' => {
		'Aidan Baxter' => 			[0, 1,1,1, 0,1,1, 1,1,0, 0,1,0, 0,0,0, 0,0, 0,0,0, 0,0,0],
		'Lee Beltran' => 			[1, 1,1,1, 0,1,1, 1,1,1, 1,1,0, 1,1,0, 0,0, 0,0,0, 0,0,0],
		'Jared Crestetto' => 		[1, 0,0,0, 0,0,0, 1,1,1, 0,1,0, 1,0,1, 0,0, 0,0,0, 0,0,0],
		'Sam Colletti' => 			[1, 1,1,1, 1,1,0, 0,1,1, 1,0,0, 1,0,1, 0,0, 0,0,0, 1,0,0],
		'Thomas Dryjanski' => 		[0, 0,1,1, 0,1,1, 0,1,1, 0,0,0, 0,0,0, 0,0, 0,0,0, 0,0,0],
		'William Hannesschalger' => [0, 0,1,0, 1,1,0, 1,1,1, 1,1,0, 1,1,1, 0,0, 0,0,0, 0,0,0],
		'Joel Heacock' => 			[0, 0,1,1, 1,1,1, 1,1,1, 0,0,0, 1,1,1, 0,0, 0,0,0, 0,0,0],
		'Joshua Hoyle' => 			[0, 1,1,1, 1,1,0, 0,1,1, 1,1,0, 1,1,1, 0,0, 0,0,0, 0,0,0],
		'Daniel Kendrick' => 		[0, 1,1,1, 1,1,1, 1,0,1, 1,1,0, 0,1,1, 0,0, 0,0,0, 0,0,0],
		'William McFarland' => 		[1, 1,1,1, 1,1,0, 1,1,1, 1,1,0, 1,0,1, 0,0, 0,0,0, 0,0,0],
		'Curtis Moore' => 			[0, 0,1,1, 1,1,1, 1,1,1, 1,0,0, 0,0,0, 0,0, 0,0,0, 0,0,0],
		'Michael Ohaneson' => 		[0, 0,0,0, 0,0,0, 0,1,0, 1,1,1, 0,1,0, 0,0, 0,0,0, 0,0,0],
		'Drake Ryan' => 			[0, 1,1,1, 0,1,1, 1,1,0, 0,0,0, 0,0,1, 0,0, 0,0,0, 0,0,0]
	},
	'Lion' => {
		'Brady Aldrich' => 			[0, 0,0,0, 0,0,1, 1,1,1, 1,1,0, 0,0,1, 0,0, 0,0,0, 0,0,0],
		'Hudson Bartolomei' => 		[0, 0,0,0, 1,0,0, 1,0,0, 0,0,0, 0,0,0, 0,0, 0,0,0, 0,0,0],
		'Asa Gleeson' => 			[0, 1,1,1, 1,1,1, 1,1,1, 1,1,1, 1,1,1, 0,0, 0,0,0, 1,1,1],
		'Daniel Hess' => 			[0, 1,1,1, 1,1,1, 1,1,1, 0,1,0, 1,0,1, 0,0, 0,0,0, 1,0,1],
		'Samuel Kendrick' => 		[0, 1,1,1, 1,1,1, 1,0,1, 1,1,1, 0,1,1, 0,0, 0,0,0, 1,0,0],
		'Silas Ketcham' => 			[1, 1,0,1, 1,1,1, 1,1,1, 1,1,0, 1,1,1, 0,0, 0,0,0, 1,0,1],
		'Gabriel Mateo' => 			[1, 1,1,1, 1,1,1, 1,1,1, 1,1,1, 0,1,1, 0,0, 0,0,0, 0,1,1],
		'Gabriel Pease' => 			[0, 0,0,0, 0,0,0, 1,1,1, 0,1,0, 0,1,0, 0,0, 0,0,0, 0,1,0],
		'Steven Reese' => 			[0, 0,0,0, 0,1,1, 1,0,1, 0,1,0, 1,0,0, 0,0, 0,0,0, 0,0,0],
		'Nathan Wilson' => 			[1, 1,1,1, 1,1,1, 1,1,1, 1,0,1, 1,1,1, 0,0, 0,0,0, 0,0,0]
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
		@kids[name] = Woodland.create(:name => name)
		# @kids[name] = patrol.boys.create(:name => name)
		patrol.boys << @kids[name]
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
# 		# Event.create(:description => "None.", :location_id => 1, :name => "#{patrol} Patrol Meeting", :starts_at => date, :ends_at => date, :heritage => 1)
# 	end
# end

puts "Creating Templates for Woodlands."

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Fox", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-1", :rank => "Fox", :heritage => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-2", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-3", :rank => "Fox", :heritage => 1,  :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-1", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-2", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-3", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-HT", :rank => "Fox", :outdoor_activities => 2, :pioneer_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-1", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-2", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-3", :rank => "Fox", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-1", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-2", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-3", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-1", :rank => "Fox", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-HT", :rank => "Fox", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-1", :rank => "Fox", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-HT", :rank => "Fox", :hobbies => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-1", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-2", :rank => "Fox", :life_skills => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-3", :rank => "Fox", :life_skills => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-1", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-2", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-3", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-1", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-2", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-3", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-HT", :rank => "Fox", :pioneer_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-1", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-2", :rank => "Fox", :heritage => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-3", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-HT", :rank => "Fox", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-1", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-HT", :rank => "Fox", :values => 3)

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Fox", :values => 1, :hobbies => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-1", :rank => "Fox", :life_skills => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-2", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-3", :rank => "Fox", :life_skills => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-1", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-2", :rank => "Fox", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-3", :rank => "Fox", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-HT", :rank => "Fox", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-1", :rank => "Fox", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-2", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-3", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-1", :rank => "Fox", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-2", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-3", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-1", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-1", :rank => "Fox", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-1", :rank => "Fox", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-2", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-3", :rank => "Fox", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-1", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-2", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-3", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-HT", :rank => "Fox", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-1", :rank => "Fox", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-2", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-3", :rank => "Fox", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-HT", :rank => "Fox", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-1", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-2", :rank => "Fox", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-3", :rank => "Fox", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-HT", :rank => "Fox", :values => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-1", :rank => "Fox", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-HT", :rank => "Fox", :heritage => 3)

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-HT", :rank => "Hawk", :outdoor_activities =>3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-1", :rank => "Hawk", :hobbies => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-2", :rank => "Hawk", :life_skills => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-3", :rank => "Hawk", :pioneer_skills => 1, :life_skills=> 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-HT", :rank => "Hawk", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-1", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-2", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-3", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-1", :rank => "Hawk", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-2", :rank => "Hawk", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-3", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-1", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-2", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-3", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-HT", :rank => "Hawk", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-1", :rank => "Hawk", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-HT", :rank => "Hawk", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-1", :rank => "Hawk", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-HT", :rank => "Hawk", :hobbies => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-2", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-3", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-2", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-3", :rank => "Hawk", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-1", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-2", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-3", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-HT", :rank => "Hawk", :pioneer_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-1", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-2", :rank => "Hawk", :heritage => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-3", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-HT", :rank => "Hawk", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-1", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-HT", :rank => "Hawk", :values => 3)

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Hawk", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Hawk", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-HT", :rank => "Hawk", :life_skills =>3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-2", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-3", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-HT", :rank => "Hawk", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-1", :rank => "Hawk", :pioneer_skills => 1, :sci_tech => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-2", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-3", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-HT", :rank => "Hawk", :hobbies => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-1", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-2", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-3", :rank => "Hawk", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-HT", :rank => "Hawk", :pioneer_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-1", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-2", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-3", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-1", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-1", :rank => "Hawk", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-1", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-2", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-3", :rank => "Hawk", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-1", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-2", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-3", :rank => "Hawk", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-HT", :rank => "Hawk", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-1", :rank => "Hawk", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-2", :rank => "Hawk", :sci_tech => 1, :life_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-3", :rank => "Hawk", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-HT", :rank => "Hawk", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-1", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-2", :rank => "Hawk", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-3", :rank => "Hawk", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-HT", :rank => "Hawk", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-1", :rank => "Hawk", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-HT", :rank => "Hawk", :values => 3)

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Lion", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Lion", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-1", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-1-HT", :rank => "Lion", :values  =>3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-1", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-2", :rank => "Lion", :heritage => 1, :hobbies => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-3", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-2-HT", :rank => "Lion", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-1", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-2", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-3", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-3-HT", :rank => "Lion", :pioneer_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-1", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-2", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-3", :rank => "Lion", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-4-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-1", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-2", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-3", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-5-HT", :rank => "Lion", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-1", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-6-HT", :rank => "Lion", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-1", :rank => "Lion", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-7-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-1", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-2", :rank => "Lion", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-3", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-8-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-1", :rank => "Lion", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-2", :rank => "Lion", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-3", :rank => "Lion", :hobbies => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-9-HT", :rank => "Lion", :hobbies => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-1", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-2", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-3", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-10-HT", :rank => "Lion", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-1", :rank => "Lion", :heritage => 1, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-2", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-3", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-11-HT", :rank => "Lion", :heritage => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-1", :rank => "Lion", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year A - A-12-HT", :rank => "Lion", :values => 3)

Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-1", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-1-HT", :rank => "Lion", :pioneer_skills =>3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-1", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-2", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-3", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-2-HT", :rank => "Lion", :values => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-1", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-2", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-3", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-3-HT", :rank => "Lion", :life_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-1", :rank => "Lion", :pioneer_skills => 1, :life_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-2", :rank => "Lion", :pioneer_skills => 1, :life_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-3", :rank => "Lion", :pioneer_skills => 1, :life_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-4-HT", :rank => "Lion", :pioneer_skills => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-1", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-2", :rank => "Lion", :values => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-3", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-5-HT", :rank => "Lion", :values => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-1", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-6-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-1", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-7-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-1", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-2", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-3", :rank => "Lion", :sci_tech => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-8-HT", :rank => "Lion", :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-1", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-2", :rank => "Lion", :outdoor_activities => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-3", :rank => "Lion", :life_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-9-HT", :rank => "Lion", :outdoor_activities => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-1", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-2", :rank => "Lion", :pioneer_skills => 1, :life_skills => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-3", :rank => "Lion", :pioneer_skills => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-10-HT", :rank => "Lion", :pioneer_skills =>2, :sci_tech => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-1", :rank => "Lion", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-2", :rank => "Lion", :heritage => 2)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-3", :rank => "Lion", :heritage => 2, :values => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-11-HT", :rank => "Lion", :values => 3)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-1", :rank => "Lion", :values => 1, :heritage => 1)
Template.create(:description => "From WT Lesson Plan (2014)", :name => "Year B - B-12-HT", :rank => "Lion", :values => 3)


puts "Creating Historic Events"
@events = {'Fox' => [],'Hawk' => [],'Lion' => [] }

@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Spring Family Campout", :starts_at => "2014-04-25 15:00", :ends_at => "2014-04-27 12:00", :outdoor_activities => 5);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - January 6", :starts_at => "2014-01-06 19:00", :ends_at => "2014-01-06 20:00", :values => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - January 13", :starts_at => "2014-01-13 19:00", :ends_at => "2014-01-13 20:00", :values => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - January 27", :starts_at => "2014-01-27 19:00", :ends_at => "2014-01-27 20:00", :hobbies => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - February 3", :starts_at => "2014-02-03 19:00", :ends_at => "2014-02-03 20:00", :heritage => 1, :values => 1);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - February 10", :starts_at => "2014-02-10, 19:00", :ends_at => "2014-02-10 20:00", :values => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - February 24", :starts_at => "2014-02-24 19:00", :ends_at => "2014-02-24 20:00", :heritage => 1, :values => 1);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - March 10", :starts_at => "2014-03-10, 19:00", :ends_at => "2014-03-10 20:00", :pioneer_skills => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - March 24", :starts_at => "2014-03-24 19:00", :ends_at => "2014-03-24 20:00", :pioneer_skills => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - March 31", :starts_at => "2014-03-31 19:00", :ends_at => "2014-03-31 20:00", :pioneer_skills => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - April 7", :starts_at => "2014-04-07 19:00", :ends_at => "2014-04-07 20:00", :outdoor_activities => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - April 21", :starts_at => "2014-04-21 19:00", :ends_at => "2014-04-21 20:00", :outdoor_activities => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - April 28", :starts_at => "2014-04-28 19:00", :ends_at => "2014-04-28 20:00", :sci_tech => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - May 5", :starts_at => "2014-05-05 19:00", :ends_at => "2014-05-05 20:00", :heritage => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - May 12", :starts_at => "2014-05-12 19:00", :ends_at => "2014-05-12 20:00", :heritage => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - May 19", :starts_at => "2014-05-19 19:00", :ends_at => "2014-05-19 20:00", :heritage => 2);
@events['Fox'] << Event.create(:description => "None.", :location_id => 1, :name => "Fox Patrol Meeting - June 2", :starts_at => "2014-06-02 19:00", :ends_at => "2014-06-02 20:00", :hobbies => 2);

@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Spring Family Campout", :starts_at => "2014-04-25 19:00", :ends_at => "2014-04-27 20:00", :outdoor_activities => 5);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - January 6", :starts_at => "2014-01-06 19:00", :ends_at => "2014-01-06 20:00", :life_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - January 13", :starts_at => "2014-01-13 19:00", :ends_at => "2014-01-13 20:00", :life_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - January 27", :starts_at => "2014-01-27 19:00", :ends_at => "2014-01-27 20:00", :life_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - February 3", :starts_at => "2014-02-03 19:00", :ends_at => "2014-02-03 20:00", :hobbies => 1, :values => 1);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - February 10", :starts_at => "2014-02-10, 19:00", :ends_at => "2014-02-10 20:00", :life_skills => 1, :values => 1);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - February 24", :starts_at => "2014-02-24 19:00", :ends_at => "2014-02-24 20:00", :life_skills => 1, :pioneer_skills => 1);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - March 10", :starts_at => "2014-03-10, 19:00", :ends_at => "2014-03-10 20:00", :pioneer_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - March 24", :starts_at => "2014-03-24 19:00", :ends_at => "2014-03-24 20:00", :sci_tech => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - March 31", :starts_at => "2014-03-31 19:00", :ends_at => "2014-03-31 20:00", :pioneer_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - April 7", :starts_at => "2014-04-07 19:00", :ends_at => "2014-04-07 20:00", :pioneer_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - April 21", :starts_at => "2014-04-21 19:00", :ends_at => "2014-04-21 20:00", :sci_tech => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - April 28", :starts_at => "2014-04-28 19:00", :ends_at => "2014-04-28 20:00", :pioneer_skills => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - May 5", :starts_at => "2014-05-05 19:00", :ends_at => "2014-05-05 20:00", :heritage => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - May 12", :starts_at => "2014-05-12 19:00", :ends_at => "2014-05-12 20:00", :heritage => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - May 19", :starts_at => "2014-05-19 19:00", :ends_at => "2014-05-19 20:00", :values => 2);
@events['Hawk'] << Event.create(:description => "None.", :location_id => 1, :name => "Hawk Patrol Meeting - June 2", :starts_at => "2014-06-02 19:00", :ends_at => "2014-06-02 20:00", :sci_tech => 2);

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Spring Family Campout", :starts_at => "2014-04-25 19:00", :ends_at => "2014-04-27 20:00", :outdoor_activities => 5);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - January 6", :starts_at => "2014-01-06 19:00", :ends_at => "2014-01-06 20:00", :values => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - January 13", :starts_at => "2014-01-13 19:00", :ends_at => "2014-01-13 20:00", :values => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - January 27", :starts_at => "2014-01-27 19:00", :ends_at => "2014-01-27 20:00", :hobbies => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - February 3", :starts_at => "2014-02-03 19:00", :ends_at => "2014-02-03 20:00", :heritage => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - February 10", :starts_at => "2014-02-10, 19:00", :ends_at => "2014-02-10 20:00", :heritage => 1, :hobbies => 1);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - February 24", :starts_at => "2014-02-24 19:00", :ends_at => "2014-02-24 20:00", :heritage => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - March 10", :starts_at => "2014-03-10, 19:00", :ends_at => "2014-03-10 20:00", :pioneer_skills => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - March 24", :starts_at => "2014-03-24 19:00", :ends_at => "2014-03-24 20:00", :pioneer_skills => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - March 31", :starts_at => "2014-03-31 19:00", :ends_at => "2014-03-31 20:00", :pioneer_skills => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - April 7", :starts_at => "2014-04-07 19:00", :ends_at => "2014-04-07 20:00", :life_skills => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - April 21", :starts_at => "2014-04-21 19:00", :ends_at => "2014-04-21 20:00", :life_skills => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - April 28", :starts_at => "2014-04-28 19:00", :ends_at => "2014-04-28 20:00", :outdoor_activities => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - May 5", :starts_at => "2014-05-05 19:00", :ends_at => "2014-05-05 20:00", :values => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - May 12", :starts_at => "2014-05-12 19:00", :ends_at => "2014-05-12 20:00", :values => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - May 19", :starts_at => "2014-05-19 19:00", :ends_at => "2014-05-19 20:00", :values => 2);
@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Lion Patrol Meeting - June 2", :starts_at => "2014-06-02 19:00", :ends_at => "2014-06-02 20:00", :sci_tech => 2);

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "June Hike 2014", :starts_at => "2014-06-26 09:00", :ends_at => "2014-06-26 10:00", :outdoor_activities => 3);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Kubb Event", :starts_at => "2014-07-25 19:00", :ends_at => "2014-07-25 20:00", :outdoor_activities => 3);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Pirate Bay", :starts_at => "2014-02-08 19:00", :ends_at => "2014-08-08 20:00", :outdoor_activities => 3);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last


@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Meals for Homeless", :starts_at => "2014-02-08 19:00", :ends_at => "2014-02-08 20:00", :service => 1);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "Hike", :starts_at => "2014-03-22 19:00", :ends_at => "2014-03-22 20:00", :outdoor_activities => 3);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last

@events['Lion'] << Event.create(:description => "None.", :location_id => 1, :name => "ISI Prep", :starts_at => "2014-05-02 19:00", :ends_at => "2014-05-02 20:00", :service => 1);
@events['Hawk'] << @events['Lion'].last
@events['Fox']  << @events['Lion'].last

puts Event.first.inspect

puts "Adding Attendance to Events"
['Fox','Hawk','Lion'].each do |rank|
	@events[rank].each do |event|
		@boys[rank].keys.each do |name|
			s = @boys[rank][name].shift
			next unless s == 1
			begin
				@kids[name].events << event
			rescue
				puts "Fuck: #{name} #{@kids[name].to_s} #{event.to_s} ".inspect
				exit
			end
			# Attendance.create(:boy_id => boy.id, :event_id => e.id)
		end
	end
end

puts "Creating Badges"
badge = Badge.create(:name => "Worthy Life - Lion", :rank => 'lion')
badge.requirements.create(:name => "Service to Church")
badge.requirements.create(:name => "Service to Church (2)")
badge.requirements.create(:name => "Perform / Lead Grace")
badge.requirements.create(:name => "Lord's Prayer Study")
badge.requirements.create(:name => "Holiday Service Discussion")
badge.requirements.create(:name => "Obstacles of Faith")
badge.requirements.create(:name => "Hero of Faith - Timothy")
badge.requirements.create(:name => "Hero of Faith - Peter")
badge.requirements.create(:name => "Family Devotional - Impact")
badge.requirements.create(:name => "Religous Emblem")
badge.requirements.create(:name => "Family Devotional - Family's Role")
badge.requirements.create(:name => "Capstone")

puts "Recalculating Leaves"
Boy.all.each do |boy|
	boy.recalcuate_leaves
end