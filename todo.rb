require_relative 'config/application'
require_relative 'app/controllers/task_controller'
require_relative 'app/models/task'
require "byebug"

# puts "Put your application code in #{File.expand_path(__FILE__)}"

def list
  tasks = TaskController.list
  tasks.each do |task|
    if task[:completed] == 1
      puts "#{task[:id]}. #{task[:task_name]} --- DONE"
    elsif task[:completed] == 0
      puts "#{task[:id]}. #{task[:task_name]}"
    end
  end
end

def task(task_id)
  TaskController.task_name(task_id)
end

def add(task_name)
  TaskController.add(task_name)
end

def delete(task_id)
  TaskController.delete(task_id)
end

def complete(task_id)
  TaskController.update(task_id)
end


input = ARGV

  if input[0] == "list"
    list
  elsif input[0] == "add"
    add(input[1..-1].join(" "))
    puts "Appended #{input[1..-1].join(" ")} to your TODO list..."
  elsif input[0] == "delete"
    puts "Deleted #{task(input[1].to_i)} from your TODO list..."
    delete(input[1].to_i)
  elsif input[0] == "complete"
    complete(input[1].to_i)
    list
  else
    "Command unidentified. Please input list, add, delete or complete."
  end

