require_relative 'config/application'
require_relative 'app/controllers/task_controller'
require_relative 'app/models/task'
require "byebug"

# puts "Put your application code in #{File.expand_path(__FILE__)}"

def list
  list = TaskController.list
  puts "TODO list:"
  list.each do |task|
    if task[:completed] == 1
      puts "#{task[:id]}. #{task[:task_name]} --- DONE"
    elsif task[:completed] == 0
      puts "#{task[:id]}. #{task[:task_name]}"
    end
  end
end

input = ARGV


  if input[0] == "list"
    list

  elsif input[0] == "add"
    TaskController.add(input[1..-1].join(" "))
    puts "Appended #{input[1..-1].join(" ")} to your TODO list..."

  elsif input[0] == "delete"
    puts "Deleted #{TaskController.task_name(input[1].to_i)} from your TODO list..."
    TaskController.delete(input[1].to_i)

  elsif input[0] == "complete"
    TaskController.update(input[1].to_i)
    list

  else
    "Command unidentified. Please input list, add, delete or complete."

  end

