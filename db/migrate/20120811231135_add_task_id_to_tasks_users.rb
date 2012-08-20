class AddTaskIdToTasksUsers < ActiveRecord::Migration
  def change
    add_column :tasks_users, :task_id, :integer
  end
end
