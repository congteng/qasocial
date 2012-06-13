# coding: utf-8
class Schedule
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :user
	has_many :todos
	field :label

end
