require_relative '../../config/application'
require_relative '../models/task.rb'
require 'byebug'

class TaskController
  attr_accessor :id, :task_name, :completed

  def self.list
    Task.all
  end

  def self.task_name(id)
    task = Task.find(id)
    task[:task_name]
  end

  def self.add(task_name)
    Task.create(task_name: task_name, completed: 0)
  end

  def self.delete(id)
    Task.delete(id)
  end

  def self.list_completed
    Task.find(:all, :condition => [completed: 1])
  end

  def self.update(id)
    task = Task.find(id)
    task[:completed] = 1
    task.save
  end

end
