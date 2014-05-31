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

["Fox", "Hawk", "Lion"].each { |r| Patrol.create(:name => r, :pack_id => 1) }

# Boy.create(
# 	:name => "Nathan Wilson",
# 	:patrol_id => Pack.all.last
# )

fox = 1; hawk = 2; lion = 3;
ranks = [nil, 'Fox','Hawk','Lion']
boys = [
	['Cooper Aldrich', fox],
	['Matthew Doe', fox],
	['Joshual Dryjanski',fox],
	['Caleb Moore',fox],
	['Aidan Baxter',hawk],
	['Lee Beltran',hawk],
	['Jared Crestetto',hawk],
	['Sam Colletti',hawk],
	['Thomas Dryjanski',hawk],
	['William Hannesschalger',hawk],
	['Joel Heacock',hawk],
	['Joshua Hoyle',hawk],
	['Daniel Kendrick',hawk],
	['William McFarland',hawk],
	['Curtis Moore',hawk],
	['Michael Ohaneson',hawk],
	['Drake Ryan',hawk],
	['Brady Aldrich',lion],
	['Hudson Bartolomei',lion],
	['Asa Gleeson',lion],
	['Daniel Hess',lion],
	['Samuel Kendrick',lion],
	['Silas Ketcham',lion],
	['Gabriel Mateo',lion],
	['Gabriel Pease',lion],
	['Steven Reese',lion],
	['Nathan Wilson',lion],
]
puts "Creating Boys"
boys.each do |b| 
	puts "-- Creating '#{b[0]}'"
	boy = Boy.create(:name => b[0], :patrol_id => b[1])
	rank = boy.ranks.create(:name => ranks[b[1]])
	# rank = Rank.create(:name => ranks[b[1]], boy_id => boy.id)
	# rank = Rank.create(:name => ranks[b[1]], :boy_id => boy.id)
	boy.current_rank_id = rank.id
	boy.save
end