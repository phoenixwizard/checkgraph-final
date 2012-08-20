class TasksUsers < ActiveRecord::Migration
  def up
  	create_table :tasks_users, :id => false do |t|
  		t.column :category_id, :integer
    	t.column :user_id, :integer
  	end
  end

  def down
  end
end
