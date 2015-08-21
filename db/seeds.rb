require 'faker'
require_relative '../app/models/task'

module TasksImporter
  def self.import
    10.times do |task|
      task = Task.create(task_name: Faker::Company.bs, completed: 0)
    end
  end
end