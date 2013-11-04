class LinksController < ApplicationController

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

end
