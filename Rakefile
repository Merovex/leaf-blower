# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

task :fixgrades => :environment do
	@boys = Boy.all
	@boys.each do |boy|
		g = (boy.patrol_id - 1) * 2
		boy.grade = g if boy.grade == 0
		boy.save
	end
end

Rails.application.load_tasks


