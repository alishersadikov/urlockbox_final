class LinksController < ApplicationController
  def index
    @hotreads = HotreadsService.get_hotreads
  end
end
