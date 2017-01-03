class UsersController < ApplicationController
  def show
    @user = User.getUser(params[:id])
    @friends = []
    @user.friends.each do | friend |
        friend = User.getUser(friend.to_s)
        @friends << friend
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user } # jsonを指定した場合、jsonフォーマットで返す
    end
  end

  def index
  end
end
