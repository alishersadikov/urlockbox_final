class Api::V1::LinksController < ApplicationController

  def create
    link = Link.new link_params
    if link.valid_url?(link.url) && link.save
      render json: link, status: 201
      # flash[:success] = "Link created!"
    else
      # flash[:danger] = "Please enter a title" if link.title.empty?
      # flash[:danger] = "Invalid URI!" if !link.valid_url?(link.url)
      render json: "No title was entered!", status: 400 if link.title.empty?
      render json: "Invalid URI!", status: 400 if !link.valid_url?(link.url)

    end
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      head :no_content
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
