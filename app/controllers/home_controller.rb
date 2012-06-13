class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def plan
  	@boards = Board.where(:board_id => nil)
  end
end
