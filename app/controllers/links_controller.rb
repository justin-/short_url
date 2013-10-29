class LinksController < ApplicationController

  def redirect
    @link = Link.find_by(shortcode: params[:shortcode])
    
    if !@link.nil?
        redirect_to @link.destination
    else
        flash[:error] = "Invalid link: #{params[:shortcode]}"
        redirect_to root_path
    end
  end

end
