class GraphsUsers < ActiveRecord::Migration
  def up
  	create_table :graphs_users, :id => false do |t|
  		t.column :graph_id, :integer
    	t.column :user_id, :integer
  	end
  end

  def down
  end
end
