class GraphsTasks < ActiveRecord::Migration
  def up
  	  	create_table :graphs_tasks, :id => false do |t|
  		t.column :graph_id, :integer
    	t.column :task_id, :integer
  	end
  end

  def down
  end
end
