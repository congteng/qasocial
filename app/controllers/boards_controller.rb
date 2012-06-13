class BoardsController < ApplicationController


	def index
		@user = User.find params[:user_id]
	end

	def create

		@user = User.find params[:user_id]
		b = Board.new params[:board]
		p_board_id = params[:b_id]
		
		if p_board_id
			p_board = Board.find p_board_id
			b.board = p_board			
		end
		b.save

		@user.boards << b

		@boards = Board.where(:board_id => nil, :user_id => params[:user_id])
	end

	def show
		@b = Board.find(params[:id])
		@user = User.find(params[:user_id])
		# @foos = @b.functionalities
	end

	def destroy
		b = Board.find(params[:id])
		@user = b.user
		b.destroy
		#@boards = Board.where(:board_id => nil)
	end

end
