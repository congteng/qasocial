class FunctionalitiesController < ApplicationController

	def index
		status = params[:status]
		@foos = Functionality.where(:status => status)						
	end

	def create
		f = Functionality.new params[:functionality]
		b_id = params[:b_id]
		p_board = Board.find b_id
		f.board = p_board
		f.save

		@boards = Board.where(:board_id => nil)
		
	end

	def update
		f = Functionality.find params[:id]
		progress = params[:progress]
		if progress == 0.to_s
			f.update_attributes(:status => 0)
		elsif progress == 100.to_s
			f.update_attributes(:status => 2)
		else
			f.update_attributes(:status => 1)
		end
				
		f.update_attributes(:progress => progress)
		@foo = f
	end

	def destroy
		f = Functionality.find params[:id]
		f.destroy
		@boards = Board.where(:board_id => nil)
	end

	def show
		@f = Functionality.find params[:id]
	end

end
