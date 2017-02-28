class LinksController < ApplicationController
  def index
    HotreadsService.get_hotreads
  end
end
