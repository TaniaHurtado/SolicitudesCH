# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
# 
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


every 1.minute  do
    runner "solicitud.self.solicitudes_cron"

  end


  every 8.day, mailto: 'pruebaunal2018@gmail.com'  do

    
  end

  job_type :runner, "cd :path && rvm 2.0.0 do bundle exec script/rails runner -e :environment ':task' :output"

    every 8.days, at: "7:00 am", roles: [:app] do
      runner "MyMailer.my_email.deliver"
    end