module LinksHelper

  def build_link_from_shortcode(shortcode)
    request.base_url + '/' + shortcode
  end 

end
