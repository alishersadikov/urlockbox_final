class Api::V1::LinksController < ApplicationController

  def index
    if current_user
      render json: current_user.links, status: 200
    else
      render json: "Unauthorized", status: 401
    end
  end

  def create
    link = Link.new link_params
    link.user_id = current_user.id
    if link.valid_url?(link.url) && link.save
      render json: link, status: 201
    else
      render json: "No title was entered!", status: 400 if link.title.empty?
      render json: "Invalid URI!", status: 400 if !link.valid_url?(link.url)
    end
  end

  def update
    link = Link.find params[:id]
    link.assign_attributes link_params
    just_read = link.read_changed? && link.read
    if link.valid_url?(link.url) && link.save
      HotreadsService.send_link(link.url) if just_read
      head :no_content
    else
      render json: "No title was entered!", status: 400 if link.title.empty?
      render json: "Invalid URI!", status: 400 if !link.valid_url?(link.url)
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
