class Task < ActiveRecord::Base
  attr_accessible :date, :description, :name
  has_many :offsprings
  has_many :childs, :through => :offsprings
  	has_and_belongs_to_many :users
  	has_and_belongs_to_many :graphs
end
