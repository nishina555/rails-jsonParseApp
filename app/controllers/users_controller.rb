class UsersController < ApplicationController
  def show
    @user = User.getUser("1")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user } # jsonを指定した場合、jsonフォーマットで返す
    end
  end

  def index
  end
end
