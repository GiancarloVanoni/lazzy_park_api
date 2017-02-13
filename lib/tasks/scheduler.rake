# Creating this task in case we deploy to Heroku, if so we gonna use
# Heroku Scheduler instead of `whenever` gem
# link: https://devcenter.heroku.com/articles/scheduler#defining-tasks

desc "This task will update pins's statuses"

task :update_pins_statuses => :environment do
  puts "Updating pin's statuses..."
  Pin.update_statuses
  puts "done."
end
