require_relative '../config/application.rb'

class Task < ActiveRecord::Base

  def self.list
    self.all
  end

  def self.add(task_name)
    self.create(task_name: task_name, completed: 0)
  end

  def self.delete(id)
    self.delete(id)
  end

  def self.list_completed
    self.find(:all, :condition => [completed: 1])
  end

  def self.update(id)
    self.find(id)
    self.completed = 1
    self.save
  end

end
