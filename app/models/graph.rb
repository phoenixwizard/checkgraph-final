class Graph < ActiveRecord::Base
  attr_accessible :name
	has_and_belongs_to_many :users
		has_and_belongs_to_many :tasks
end
