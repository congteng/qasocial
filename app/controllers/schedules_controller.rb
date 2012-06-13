class SchedulesController < ApplicationController

	def index
		user = User.find params[:user_id]
		@schedules = user.schedules
	end

	def create
		puts "---------------------------__>>>>>>>>>_#{params}"
	end

	def new
		
	end

end
