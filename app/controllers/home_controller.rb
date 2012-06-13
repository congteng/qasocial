class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def plan
  	@user = User.where(:email => "congteng45@gmail.com").first
  	@boards = Board.where(:board_id => nil, :user_id => @user.id)
  end
end
