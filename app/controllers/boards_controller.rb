class BoardsController < ApplicationController

	def create

		b = Board.new params[:board]
		p_board_id = params[:b_id]
		
		if p_board_id
			p_board = Board.find p_board_id
			b.board = p_board			
		end
		b.save

		@boards = Board.where(:board_id => nil)
	end

	def show
		@b = Board.find(params[:id])
		# @foos = @b.functionalities
	end

	def destroy
		b = Board.find(params[:id])
		b.destroy
		@boards = Board.where(:board_id => nil)
	end

end
