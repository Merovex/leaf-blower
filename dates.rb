#!/Users/bwilson/.rvm/rubies/ruby-2.0.0-p481/bin/ruby

require 'date'
require 'json'

start_date = Date.today - 150# your start
 end_date = Date.today + 7 # your end
 my_days = [1] # day of the week in 0-6. Sunday is day-of-week 0; Saturday is day-of-week 6.
 result = (start_date..end_date).to_a.select {|k| my_days.include?(k.wday)}

 # raise result.inspect
puts result.to_json