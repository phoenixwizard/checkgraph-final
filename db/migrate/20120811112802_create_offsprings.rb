class CreateOffsprings < ActiveRecord::Migration
  def change
    create_table :offsprings do |t|
      t.integer :task_id
      t.integer :child_id

      t.timestamps
    end
  end
end
