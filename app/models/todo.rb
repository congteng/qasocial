# coding: utf-8
class Todo
	include Mongoid::Document
	include Mongoid::Timestamps

	belongs_to :schedule

	# # 从几点到几点
	field :from, :type => String, :default => "00:00"
	field :to, :type => String, :default => "24:00"
	field :content, :type => String, :default => ""

end
