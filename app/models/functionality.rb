class Functionality
  	include Mongoid::Document
  	include Mongoid::Timestamps

  	field :say

  	# 0: todo, 1: doing, 2:done
	field :status, :type => Integer, :default => 0

	field :progress, :type => Integer, :default => 0

  	belongs_to :board

  	attr_accessible :say, :status, :progress
end
