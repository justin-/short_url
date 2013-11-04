class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @links = Link.where(user_id: params[:id]).order('created_at DESC')
  end  
  
end
