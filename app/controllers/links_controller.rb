class LinksController < ApplicationController
  def index
    @links = current_user.links
    @hot_links = current_user.links.hot
  end
end
