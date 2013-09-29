class LinksController < ApplicationController

  def index
    @link = Link.find_by(shortcode: params[:shortcode])
    redirect_to @link.destination
  end

end
