require_relative '../../config/application.rb'

class CreateTables < ActiveRecord::Migration
  def change

    create_table :tasks do |t|
      t.string :task_name
      t.integer :completed
      t.timestamps null: false
    end
  end
end