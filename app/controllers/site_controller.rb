class SiteController < ApplicationController
  def home #name of method and page should be the same
    render 'home' #name of view template
  end
  def contact
    # can take render line out completely! It will take you to /method_name
  end
end

