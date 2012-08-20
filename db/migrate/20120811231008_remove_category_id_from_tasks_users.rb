class RemoveCategoryIdFromTasksUsers < ActiveRecord::Migration
  def up
    remove_column :tasks_users, :category_id
  end

  def down
    add_column :tasks_users, :category_id, :integer
  end
end
