class UsersController < ApplicationController
  def show
    if params[:id].present?
      if params[:id].to_i > 5 || params[:id].to_i < 1 then
        flash.now[:alert] = 'IDは1から5の間で入力してください'
        render 'index' and return
      end
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
    else
      flash.now[:alert] = 'IDを入力してください'
      render 'index' and return
    end
  end

  def index
  end
end
