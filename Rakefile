# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
def must_stdin(message, default="")
  a = default
  while a.nil? or a.empty? 
    a = get_stdin(message)
  end
  return a
end

task :fixgrades => :environment do
	@boys = Boy.all
	@boys.each do |boy|
		g = (boy.patrol_id - 1) * 2
		boy.grade = g if boy.grade == 0
		boy.save
	end
end
task :fixattendance => :environment do
	Rank.all.each { |r| r.save }
	# @boys = Boy.all
	# @boys.each do |b|
	# 	b.attendances.each do |a|
	# 		a.rank = b.current_rank
	# 		a.save
	# 		a.rank.save
	# 	end
	# end
end
task :syncdb => :environment do 
	system "dropdb leaf_tracker;"
	system "createdb -Obwilson -Eutf8 leaf_tracker;"
	system "heroku pg:backups public-url"
    system "curl -o latest.dump `heroku pg:backups public-url`"
    system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U bwilson -d leaf_tracker latest.dump"
end

Rails.application.load_tasks

task :github, :msg do |t, args|
	msg = must_stdin("Enter a commit message: ", args.msg)
	branch = `git symbolic-ref --short -q HEAD`.strip
	
	system "git add -A ."
	system "git commit -am '#{msg.gsub("'","")}'"
	system "github_changelog_generator"
	system "git push origin #{branch}"
end


