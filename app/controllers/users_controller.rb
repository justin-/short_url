class UsersController < ApplicationController

  before_action :correct_user

  def show
    @links = @user.links.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end  
  
  protected
  
    def correct_user
      @user = User.find_by(id: params[:id]) if signed_in?
      
      if (@user.nil? || (current_user.id != params[:id].to_i))
        flash[:error] = "You're not allowed to view other users' links"
        redirect_to root_path
      end
    end
  
end
