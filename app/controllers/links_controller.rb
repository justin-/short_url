class LinksController < ApplicationController

  before_action :correct_user, only: [:destroy]
  
  def create
    @link = Link.create!(user_id: session[:user_id], destination: params[:link][:destination])
    flash[:notice] = "Link created"
    redirect_to user_path(current_user)
  end

  def redirect
    @link = Link.find_by(shortcode: params[:shortcode])
    
    if @link
        redirect_to @link.destination
    else
        flash[:error] = "Invalid link"
        redirect_to root_path
    end
  end
  
  def destroy
    @link.destroy
    flash[:notice] = "Link deleted"
    redirect_to user_path(current_user)
  end
  
  protected
  
    def correct_user
      @link = current_user.links.find_by(id: params[:id])
      redirect_to root_path if @link.nil?
    end

end
