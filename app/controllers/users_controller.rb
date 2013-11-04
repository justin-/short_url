class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @links = @user.links.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end  
  
end
