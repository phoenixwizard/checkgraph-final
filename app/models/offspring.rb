class Offspring < ActiveRecord::Base
	belongs_to :tasks
	belongs_to :child, :class_name=>"Task"
  attr_accessible :child_id, :task_id
end
